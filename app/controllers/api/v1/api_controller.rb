module Api
  module V1
    class ApiController < ActionController::API
      include JsonWebToken

      before_action :authenticate_request

      private
      def authenticate_request
        if request.headers["Authorization"] != nil
          header = request.headers["Authorization"]
          header = header.split(" ").last if header
          decoded = jwt_decode(header)
          @current_user = User.find(decoded[:user_id])
        else
          render json: "Unauthorized".to_json
        end  
      end 
    end 
  end
end