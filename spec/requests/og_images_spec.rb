require 'rails_helper'

RSpec.describe "OgImages", type: :request do
  describe "GET /show" do
    it "returns http success" do
      get "/og_images/show"
      expect(response).to have_http_status(:success)
    end
  end

end
