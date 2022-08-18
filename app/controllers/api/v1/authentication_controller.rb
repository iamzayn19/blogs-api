module Api
  module V1
    class AuthenticationController < ApiController
      skip_before_action :authenticate_request

      def login
        params.permit!
        byebug
        
        @user = User.find_by_email(params[:email])
        if @user&.authenticate(params[:password])
          token = jwt_encode(user_id: @user.id)
          byebug
          render json: { token: token }, status: :ok
        else 
          render json: { error: 'unauthorized' }, status: :unauthorized
        end
      end 
    end
  end 
end  