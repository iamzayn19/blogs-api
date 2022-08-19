class Api::V1::RegistrationController < Api::V1::ApiController
  skip_before_action :authenticate_request
  
  def create
    user = User.new(user_params)
    # @user = User.find_by_email(params[:email])
    # if @user&.authenticate(params[:password])
    #   token = jwt_encode(user_id: @user.id)
    #   render json: { token: token }, status: :ok
    # else 
    #   render json: { error: 'unauthorized' }, status: :unauthorized
    # end
  end
  
  private
    def user_params
      params.permit(:email,:password)
    end 
end