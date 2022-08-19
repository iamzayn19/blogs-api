module Api
  module V1
    class BlogLikesController < ApiController
      skip_before_action :authenticate_request, only: [:index]
      before_action :set_blog_like, only: :destroy

      def index
        if Blog.find(params[:blog_id]).status == "published"
          @blog_likes = BlogLike.where(blog_id: params[:blog_id]).kept
          render json: BlogLikeSerializer.new(@blog_likes).serializable_hash.to_json, status: 200
        else
          render json: "This article is not published".to_json, status: 401
        end 
      end 
      
      def create
        params[:user_id] = @current_user.id
        if Blog.find(params[:blog_id]).liked?(@current_user)
          render json: "You've already like this blog!".to_json, status: 401
        else 
          @blog_like = BlogLike.create(blog_like_params)
          if @blog_like.save
            render json: BlogLikeSerializer.new(@blog_like).serializable_hash.to_json, status: 200
          else 
            render json: "Couldn't like the post at this time. Try again some other time.".to_json, status: 401
          end 
        end 
      end

      def destroy
        if @blog_like.user_id == @current_user.id
            @blog_like.discard 
          render json: "Like removed!".to_json, status: 200
        else
          render json: "Like removal unsuccessful!".to_json, status: 401
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
