require 'rails_helper'

RSpec.describe "PasswordResets", type: :request do
  describe "GET /new" do
    it "returns http success" do
      get "/password_resets/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/password_resets/create"
      expect(response).to have_http_status(:success)
    end
  end

end
