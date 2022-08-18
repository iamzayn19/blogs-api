module Api
  module V1
    class ApiController < ActionController::API
      include JsonWebToken

      before_action :authenticate_request

      private
      def authenticate_request
        
        header = request.headers["Authorization"]
        header = header.split(" ").last if header
        decoded = jwt_decode(header)
        byebug
        @current_user = User.find(decoded[:user_id])
      end 
    end 
  end
end