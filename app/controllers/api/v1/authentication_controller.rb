class Api::V1::AuthenticationController < Api::V1::ApiController
  skip_before_action :authenticate_request
  
  def login
    params.permit!
    @user = User.find_by_email(params[:email])
    if @user&.authenticate(params[:password])
      token = jwt_encode(user_id: @user.id)
      render json: { token: token }, status: :ok
    else 
      render json: { error: 'unauthorized' }, status: :unauthorized
    end
  end 
end

# session_controller
# - create
# registration_controller
# - create