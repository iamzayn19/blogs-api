require 'rails_helper'

RSpec.describe "Api::V1::Authentication", type: :request do
  describe "POST /login" do 
    User.create(email: 'zain@gmail.com', first_name: 'zain', last_name: 'ul abidin', user_type: 0, password: 'password', password_confirmation: 'password')
    let(:params) { { email: 'zain@gmail.com' , password: 'password' }}
    it "returns authorization token" do
      post '/api/v1/auth/login', params: params
      expect(response).to have_http_status(200)
  end 
  end
end
