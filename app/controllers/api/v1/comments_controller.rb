module Api
  module V1
    class CommentsController < ApiController
      skip_before_action :authenticate_request
      before_action :set_comment
      
      def create
        render json: params, status: :ok
      end

      def destroy
        render json: "Comment Destroy called", status: :ok
      end
      
      private

      def set_comment
        @comment = Comment.find(params[:id])
      end 

    end
  end 
end  