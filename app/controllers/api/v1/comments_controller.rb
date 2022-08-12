module Api
  module V1
    class CommentsController < ApiController
      skip_before_action :authenticate_request
      before_action :set_comment
      
      def create
        @blog = Blog.find(params[:blog_id])
        @comments = @blog.comments.create(comment_params)
        render json: @comments, status: :ok
      end

      def destroy
        render json: "Comment Destroy called", status: :ok
      end
      
      private

      def set_comment
        @comment = Comment.find(params[:id])
      end 

      def comment_params
        params.require(:comment).permit(:text)
      end 

    end
  end 
end  
