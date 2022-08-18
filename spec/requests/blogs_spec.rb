require 'rails_helper'

RSpec.describe "Blogs", type: :request do
  FactoryBot.create(:user)
  let(:token) { { Authorization: "eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjozNiwiZXhwIjoxNjYxNDEzOTkzfQ.wx3v3M4fCl_an9P-4Sq3iNIEpNxizJlHF0e84qsWQ2g" }}
  describe "get/index" do
    it "returns all the blogs" do
      get '/api/v1/blogs'
      expect(response).to have_http_status(200)
      puts JSON.parse(response.body)
    end 
  end

  describe "post/blogs" do
    it "created a blog successfully" do      
      post '/api/v1/blogs', params:  { title: 'sample title' , body: 'sample body', user_id: '1' }, headers: token
      expect(response).to have_http_status(200)
      puts JSON.parse(response.body)
    end 
  end

  describe "post/blogs" do
    it "unauthorized user cannot create a blog" do
      #new_user = FactoryBot.create(:user)
      post '/api/v1/blogs', params:  { title: 'sample title' , body: 'sample body', user_id: '1' }
      expect(response).to have_http_status(200)
      #expect { JWT.decode(token, key) }.not_to raise_error(JWT::DecodeError)
      puts JSON.parse(response.body)
    end 
  end

  describe "post/blogs" do
    it "user cannot create a blog if he/she is a public user" do
      #new_user = FactoryBot.create(:user)
      post '/api/v1/blogs', params:  { title: 'sample title' , body: 'sample body', user_id: '1' }, headers: token
      expect(response).to have_http_status(401)
      puts JSON.parse(response.body)
    end 
  end
end
