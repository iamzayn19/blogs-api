module Api
  module V1
    class CommentsController < ApiController
      skip_before_action :authenticate_request, only: [:index]
      #before_action :set_comment, except: :index

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
          render json: "Error"
        end 
      end

      def destroy
        render json: "Comment Destroy called", status: :ok
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
