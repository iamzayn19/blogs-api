require 'rails_helper'

RSpec.describe "Comments", type: :request do
  describe "GET /index" do
    let(:params) { { blog_id: 12 }}
    it "get comments for a post" do
      get '/api/v1/blogs/12/comments', params: params
      expect(response).to have_http_status(200)
    end 
  end
end
