  class Api::V1::ApiController < ActionController::API
    include JsonWebToken
    include Pagy::Backend
    before_action :authenticate_request

    private
      def authenticate_request
        if request.headers["Authorization"] != nil
          header = request.headers["Authorization"]
          header = header.split(" ").last if header
          decoded = jwt_decode(header)
          @current_user = User.find(decoded[:user_id])
        else
          render json: "Unauthorized".to_json, status: 401
        end  
      end 
  end 