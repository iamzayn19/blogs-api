class Api::V1::SessionController < Api::V1::ApiController
  skip_before_action :authenticate_request
  
  def create
    @user = User.find_by_email(params[:email])
    if @user&.authenticate(params[:password])
      if @user.confirmed?
        token = jwt_session_encode(user_id: @user.id)
        render json: { token: token }, status: :ok
      else  
        render json: { error: "Please confirm your account first, then attempt login. "}, status: :unauthorized
      end
    else 
      render json: { error: 'unauthorized' }, status: :unauthorized
    end
  end 
end