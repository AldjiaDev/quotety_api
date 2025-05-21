require 'rails_helper'

RSpec.describe "GET /api/v1/me", type: :request do
  let(:user) {
    User.create!(
      email: "me@example.com",
      username: "meuser",
      password: "password123",
      password_confirmation: "password123"
    )
  }

  let(:token) {
    JsonWebToken.encode(user_id: user.id)
  }

  context "avec un token valide" do
    it "retourne les infos de l'utilisateur connecté" do
      get "/api/v1/me", headers: {
        "Authorization" => "Bearer #{token}"
      }

      expect(response).to have_http_status(:ok)
      json = JSON.parse(response.body)
      expect(json["email"]).to eq(user.email)
      expect(json["username"]).to eq(user.username)
    end
  end

  context "sans token" do
    it "retourne une erreur 401" do
      get "/api/v1/me"
      expect(response).to have_http_status(:unauthorized)
    end
  end

  context "avec un token invalide" do
    it "retourne une erreur 401" do
      get "/api/v1/me", headers: {
        "Authorization" => "Bearer mauvais.token.truc"
      }

      expect(response).to have_http_status(:unauthorized)
    end
  end
end
