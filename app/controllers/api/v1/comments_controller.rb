module Api
  module V1
    class CommentsController < ApiController
      skip_before_action :authenticate_request, only: [:index]
      before_action :set_comment, only: :destroy

      def index
        @comments = Comment.where(blog_id: params[:blog_id])
        render json: @comments
      end 
      
      def create
        params[:user_id] = @current_user.id
        @comment = Comment.create(comment_params)
        if @comment.save
          render json: @comment
        else 
          render json: "Sorry, your comment couldn't be saved unfortunately!"
        end 
      end

      def destroy
        if @comment.user_id == @current_user.id
          @comment.discard 
          render json: "Comment deleted successfully!"
        else
          render json: "Comment deletion unsuccessful!"
        end 
      end
      
      private

      def set_comment
        @comment = Comment.find(params[:id])
      end 

      def comment_params
        params.permit(:text,:blog_id,:user_id)
      end 

    end
  end 
end  
