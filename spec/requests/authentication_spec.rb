require 'rails_helper'

RSpec.describe "Authentication", type: :request do

  describe "POST /login" do 
    let(:params) { { email: 'zain@gmail.com' , password: 'password' }}
    it "returns authorization token" do
      new_user = FactoryBot.create(:user)
      
      post '/api/v1/auth/login', params: params
      token = JSON.parse(response.body)['token']
      #expect { JWT.decode(token, key) }.not_to raise_error(JWT::DecodeError)
      expect(response).to have_http_status(200)
      puts response.body
  end 
  end
end

