require 'rails_helper'

RSpec.describe "SendEmails", type: :request do
  describe "GET /create" do
    it "returns http success" do
      get "/send_emails/create"
      expect(response).to have_http_status(:success)
    end
  end

end
