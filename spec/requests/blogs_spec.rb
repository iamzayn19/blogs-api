require 'rails_helper'

RSpec.describe "Blogs", type: :request do
  let(:token) { { Authorization: "eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE2NjE0MDg1OTF9.ncBN5lTiT4uIEC7sD7ZXzzlr_CleItXEDZwmFzjsuOQ" }}
  describe "get/index" do
    it "returns all the blogs" do
      get '/api/v1/blogs'
      expect(response).to have_http_status(200)
    end 
  end

  describe "post/blogs" do
    it "created a blog successfully" do
      #new_user = FactoryBot.create(:user)

      post '/api/v1/blogs', params:  { title: 'sample title' , body: 'sample body', user_id: '1' }, headers: token
      expect(response).to have_http_status(200)
    end 
  end
end
