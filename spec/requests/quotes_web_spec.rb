require 'rails_helper'

RSpec.describe "QuotesWebs", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/quotes_web/index"
      expect(response).to have_http_status(:success)
    end
  end

end
