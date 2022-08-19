require 'rails_helper'

RSpec.describe "BlogLikes", type: :request do
  user = FactoryBot.create(:user)
  blog = Blog.last
  blog.status = "published"
  blog.save!
  blog_like = FactoryBot.create(:blog_like)
  blog_like.user_id = user.id
  blog_like.blog_id = blog.id
  blog_like.save!
  random_blog_id = blog.id
  blog_like_id = blog_like.id
  random_delete_blog_like_id = BlogLike.first.id
  let(:auth_params) { {email: user.email, password: user.password } }
  let(:blog_like_params) { { user_id: blog_like.user_id, blog_id: blog_like.blog_id } }
  let(:index_params) { { id: random_blog_id } }
  let(:show_params) { { id: blog_like_id } }
  let(:delete_params) { { id: blog_like_id } }
  let(:random_delete_params) {{ id: random_delete_blog_like_id }}
  let(:token) { { Authorization: "" }}
  describe "testing blog likes" do

    before(:each) do
      post '/api/v1/auth/login', params: auth_params
      token[:Authorization] = JSON.parse(response.body)['token']
    end

    it "user can delete a post like if he/she did it" do
      delete "/api/v1/blogs/#{index_params[:id]}/blog_likes/#{delete_params[:id]}", headers: token
      expect(response).to have_http_status(200)
      puts JSON.parse(response.body)
    end

    it "user cannot delete a post like if he/she didn't do it" do
      delete "/api/v1/blogs/#{index_params[:id]}/blog_likes/#{random_delete_params[:id]}", headers: token
      expect(response).to have_http_status(401)
      puts JSON.parse(response.body)
    end    
  end
end
