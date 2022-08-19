class Api::V1::RegistrationController < Api::V1::ApiController
  skip_before_action :authenticate_request
  
  def create
    user = User.new(user_params)
    if user.save
      UserMailer.signup_confirmation(user).deliver
      render json: "Email delivered"
    else 
      render json: "Email not delivered"
    end
  end
  
  private
    def user_params
      params.permit(:first_name,:last_name,:email,:password)
    end 
end