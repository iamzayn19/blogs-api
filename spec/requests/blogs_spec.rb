require 'rails_helper'

RSpec.describe "Blogs", type: :request do
  $user = FactoryBot.create(:user)
  $user.reload
  let(:auth_params) { {email: $user.email, password: $user.password } }

  #let(:token) { { Authorization: "eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjozNiwiZXhwIjoxNjYxNDEzOTkzfQ.wx3v3M4fCl_an9P-4Sq3iNIEpNxizJlHF0e84qsWQ2g" }}
  describe "get/index" do
    
   
    it "returns all the blogs" do
      post '/api/v1/auth/login', params: auth_params
      token = JSON.parse(response.body)['token'] 
        byebug
      get '/api/v1/blogs'
      expect(response).to have_http_status(200)
      puts JSON.parse(response.body)
    end 
  end

  
  
end
