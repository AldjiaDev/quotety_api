require 'rails_helper'

RSpec.describe "API::V1::Favorites", type: :request do
  let(:user) {
    User.create!(
      email: "user@example.com",
      username: "testuser",
      password: "password123",
      password_confirmation: "password123"
    )
  }

  let(:quote) {
    Quote.first || Quote.create!(
      content: "Ceci est une citation test.",
      author: Author.create!(name: "Test Author", slug: "test-author", bio: "Bio test"),
      category: Category.create!(name: "Test", slug: "test")
    )
  }

  let(:token) {
    JsonWebToken.encode(user_id: user.id)
  }

  describe "GET /api/v1/favorites" do
    before do
      user.favorites.create!(quote: quote)
    end

    it "retourne les favoris de l'utilisateur" do
      get "/api/v1/favorites", headers: { "Authorization" => "Bearer #{token}" }

      expect(response).to have_http_status(:ok)
      json = JSON.parse(response.body)
      expect(json.first["content"]).to eq(quote.content)
    end
  end

  describe "POST /api/v1/favorites" do
    it "ajoute une citation aux favoris" do
      post "/api/v1/favorites",
        headers: { "Authorization" => "Bearer #{token}" },
        params: { quote_id: quote.id }

      expect(response).to have_http_status(:created)
      expect(user.favorites.exists?(quote_id: quote.id)).to be true
    end
  end

  describe "DELETE /api/v1/favorites/:id" do
    it "supprime une citation des favoris" do
      favorite = user.favorites.create!(quote: quote)

      delete "/api/v1/favorites/#{favorite.id}", headers: { "Authorization" => "Bearer #{token}" }

      expect(response).to have_http_status(:ok)
      expect(user.favorites.exists?(id: favorite.id)).to be false
    end
  end
end
