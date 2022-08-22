class Api::V1::RegistrationController < Api::V1::ApiController
  skip_before_action :authenticate_request
  
  def create
    user = User.new(user_params)
    if user.save
      token = jwt_confirmation_encode(user_id: user.id)
      UserMailer.signup_confirmation(user,token).deliver
      render json: "Account creation successful. Please check your email for confirmation link."
    else 
      render json: "Sorry, your account couldn't be created."
    end
  end
  
  private
    def user_params
      params.permit(:first_name,:last_name,:email,:password)
    end 
end