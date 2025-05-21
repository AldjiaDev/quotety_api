require 'rails_helper'

RSpec.describe "API::V1::Auth", type: :request do
  describe "POST /api/v1/register" do
    it "crée un nouvel utilisateur avec succès" do
      post "/api/v1/register", params: {
        email: "test@quotety.com",
        username: "testuser",
        password: "password123",
        password_confirmation: "password123"
      }

      expect(response).to have_http_status(:created)
      expect(JSON.parse(response.body)["user"]["email"]).to eq("test@quotety.com")
    end
  end

  describe "POST /api/v1/login" do
    before do
      User.create!(
        email: "login@quotety.com",
        username: "loginuser",
        password: "password123",
        password_confirmation: "password123"
      )
    end

    it "connecte un utilisateur existant avec succès" do
      post "/api/v1/login", params: {
        email: "login@quotety.com",
        password: "password123"
      }

      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body)["user"]["username"]).to eq("loginuser")
    end

    it "échoue avec un mauvais mot de passe" do
      post "/api/v1/login", params: {
        email: "login@quotety.com",
        password: "wrongpass"
      }

      expect(response).to have_http_status(:unauthorized)
    end
  end
end
