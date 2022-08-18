require 'rails_helper'

RSpec.describe "Api::V1::Authentication", type: :request do

  describe "POST /login" do 
    let(:params) { { email: 'usama@gmail.com' , password: 'usama' }}
    it "returns authorization token" do
      new_user = FactoryBot.create(:user)
      
      post '/api/v1/auth/login', params: params
      expect(response).to have_http_status(200)
  end 
  end
end
