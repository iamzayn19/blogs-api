module Api
  module V1
    class CommentsController < ApiController
      skip_before_action :authenticate_request, only: [:index]
      before_action :set_comment, only: :destroy

      def index
        if Blog.find(params[:blog_id]).status == "published"
          @comments = Comment.where(blog_id: params[:blog_id]).kept
          render json: CommentSerializer.new(@comments).serializable_hash.to_json, status: 200
        else 
          render json: "The article is not published".to_json, status: 401
        end 
      end 
      
      def create
        params[:user_id] = @current_user.id
        @comment = Comment.create(comment_params)
        if @comment.save
          render json: CommentSerializer.new(@comment).serializable_hash.to_json, status: 200
        else 
          render json: "Sorry, your comment couldn't be saved unfortunately!".to_json, status: 401
        end 
      end

      def destroy
        if @comment.user_id == @current_user.id
          @comment.discard 
          render json: "Comment deleted successfully!".to_json, status: 200
        else
          render json: "Comment deletion unsuccessful!".to_json, status: 401
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
