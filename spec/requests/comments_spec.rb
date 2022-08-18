require 'rails_helper'

RSpec.describe "Comments", type: :request do
  user = FactoryBot.create(:user)
  blog = FactoryBot.create(:blog)
  blog.user_id = user.id
  blog.save!
  random_id = Blog.first.id
  let(:auth_params) { {email: user.email, password: user.password } }
  let(:blog_params) { { title: blog.title, body: blog.body, user_id: blog.user_id } }
  let(:show_params) { { id: 41 } }
  let(:delete_params) { { id: random_id } }
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

    it "user can view a specific blog" do
      get "/api/v1/blogs/#{show_params[:id]}"
     
      expect(response).to have_http_status(200)
      puts JSON.parse(response.body)
    end

    it "user can delete a blog if he/she wrote it" do
      delete_params[:id] = blog.id
      delete "/api/v1/blogs/#{delete_params[:id]}", headers: token
      expect(response).to have_http_status(200)
      puts JSON.parse(response.body)
    end

    # it "user cannot delete a blog if he/she has already deleted the blog" do
    #   delete_params[:id] = blog.id
    #   delete "/api/v1/blogs/#{delete_params[:id]}", headers: token
      
    #   expect(response).to have_http_status(401)
    #   puts JSON.parse(response.body)
    # end

    # it "user cannot view a blog if it is deleted" do
    #   show_params[:id] = blog.id;
    #   byebug
    #   get "/api/v1/blogs/#{show_params[:id]}"
    #   expect(response).to have_http_status(401)
    #   puts JSON.parse(response.body)
    # end

    it "user cannot delete a blog if he/she didn't write it" do
      delete "/api/v1/blogs/#{delete_params[:id]}", params: delete_params, headers: token
      expect(response).to have_http_status(401)
      puts JSON.parse(response.body)
    end
  end
end
