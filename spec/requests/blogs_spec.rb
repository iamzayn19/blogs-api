require 'rails_helper'
RSpec.describe "Blogs", type: :request do
  user = FactoryBot.create(:user)
  blog = FactoryBot.create(:blog)
  let(:auth_params) { {email: user.email, password: user.password } }
  let(:blog_params) { { title: blog.title, body: blog.body, user_id: user.id} }
  let(:token) { { Authorization: "" }}
  describe "testing blogs" do

    before(:each) do
      post '/api/v1/auth/login', params: auth_params
      token[:Authorization] = JSON.parse(response.body)['token']
    end

    it "returns all the blogs" do
      get '/api/v1/blogs'
      expect(response).to have_http_status(200)
      puts JSON.parse(response.body)
    end

    it "created a blog successfully" do
      user.user_type = 0
      user.save
      post '/api/v1/blogs', params: blog_params, headers: token
      expect(response).to have_http_status(200)
      puts JSON.parse(response.body)
    end


    it "unauthorized user cannot create a blog" do
      post '/api/v1/blogs', params: blog_params
      expect(response).to have_http_status(200)
      puts JSON.parse(response.body)
    end

    it "user cannot create a blog if he/she is a public user" do
      user.user_type = 1
      user.save
      post '/api/v1/blogs', params: blog_params, headers: token
      expect(response).to have_http_status(401)
      puts JSON.parse(response.body)
    end

  end
end