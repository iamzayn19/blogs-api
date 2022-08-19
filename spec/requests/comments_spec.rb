require 'rails_helper'

RSpec.describe "Comments", type: :request do
  user = FactoryBot.create(:user)
  blog = Blog.last
  blog.status = "published"
  blog.save!
  comment = FactoryBot.create(:comment)
  comment.user_id = user.id
  comment.blog_id = blog.id
  comment.save!
  random_blog_id = blog.id
  comment_id = Comment.last.id
  random_delete_comment_id = Comment.first.id
  let(:auth_params) { {email: user.email, password: user.password } }
  let(:comment_params) { { text: comment.text, blog_id: comment.blog_id } }
  let(:index_params) { { id: random_blog_id } }
  let(:show_params) { { id: comment_id } }
  let(:delete_params) { { id: comment_id } }
  let(:random_delete_params) {{ id: random_delete_comment_id }}
  let(:token) { { Authorization: "" }}
  describe "testing blog comments" do

    before(:each) do
      post '/api/v1/auth/login', params: auth_params
      token[:Authorization] = JSON.parse(response.body)['token']
    end
    
    it "returns all the comments for a blog" do  
      get "/api/v1/blogs/#{index_params[:id]}/comments"
      expect(response).to have_http_status(200)
      puts JSON.parse(response.body)
    end

    it "created a comment successfully" do
      post '/api/v1/auth/login', params: auth_params
      token[:Authorization] = JSON.parse(response.body)['token']

      post "/api/v1/blogs/#{index_params[:id]}/comments", params: comment_params, headers: token
      expect(response).to have_http_status(200)
      puts JSON.parse(response.body)
    end

    it "unauthorized ruser cannot create a comment" do
      post "/api/v1/blogs/#{index_params[:id]}/comments", params: comment_params
      expect(response).to have_http_status(401)
      puts JSON.parse(response.body)
    end

    it "user can delete a comment if he/she wrote it" do
      delete "/api/v1/blogs/#{index_params[:id]}/comments/#{delete_params[:id]}", headers: token
      expect(response).to have_http_status(200)
      puts JSON.parse(response.body)
    end

    it "user cannot delete a comment if he/she didn't write it" do
      delete "/api/v1/blogs/#{index_params[:id]}/comments/#{random_delete_params[:id]}", headers: token
      expect(response).to have_http_status(401)
      puts JSON.parse(response.body)
    end
    
  end
end
