module Api
  module V1
    class BlogLikesController < ApiController
      skip_before_action :authenticate_request, only: [:index]
      before_action :set_blog_like, only: :destroy

      def index
        @blog_likes = BlogLike.where(blog_id: params[:blog_id])
        render json: @blog_likes.count
      end 
      
      def create
        params[:user_id] = @current_user.id
        if Blog.find(params[:blog_id]).liked?
          render json: "You've already liked the post"
        else 
          @blog_like = BlogLike.create(blog_like_params)
          if @blog_like.save
            render json: @blog_like
          else 
            render json: "Couldn't like the post at this time. Try again some other time."
          end 
        end 
      end

      def destroy
        if @blog_like.user_id == @current_user.id
          @blog_like.discard 
          render json: "Like removed!"
        else
          render json: "Like removal unsuccessful!"
        end 
      end
      
      private

      def set_blog_like
        @blog_like = BlogLike.find(params[:id])
      end 

      def blog_like_params
        params.permit(:blog_id,:user_id)
      end 

    end
  end 
end  
