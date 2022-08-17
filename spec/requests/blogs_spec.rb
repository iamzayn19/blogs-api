require 'rails_helper'

RSpec.describe "Blogs", type: :request do
  describe "GET /index" do
    it "returns all the blogs" do
      get '/api/v1/blogs'
      expect(response).to have_http_status(200)
    end 
  end
end
