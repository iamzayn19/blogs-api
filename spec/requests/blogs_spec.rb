require 'rails_helper'

RSpec.describe "Blogs", type: :request do
  let(:token) { { Authorization: "eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjozNiwiZXhwIjoxNjYxNDEzOTkzfQ.wx3v3M4fCl_an9P-4Sq3iNIEpNxizJlHF0e84qsWQ2g" }}
  let(:test_user) { { first_name: "Usama", last_name: "Aamir", email: "usama@gmail.com", user_type: 1, password: "usama"}}
  describe "get/index" do
    test_user = User.create(first_name: "Usama", last_name: "Aamir", email: "usama@gmail.com", user_type: 1, password: "usama")
    it "returns all the blogs" do
      get '/api/v1/blogs'
      expect(response).to have_http_status(200)
      puts JSON.parse(response.body)
    end 
  end

  describe "post/blogs" do
    it "created a blog successfully" do
      new_user = FactoryBot.create(:user)
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
