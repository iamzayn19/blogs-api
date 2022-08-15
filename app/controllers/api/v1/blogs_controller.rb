module Api
  module V1
    class BlogsController < ApiController
      skip_before_action :authenticate_request, only: [:index, :show]
      before_action :set_blog, only: [:show, :destroy]
      
      def index
        @blogs = Blog.kept
        render json: BlogSerializer.new(@blogs).serializable_hash.to_json
      end
      
      def create
        if @current_user.user_type == "author"
          params[:user_id] = @current_user.id
          @blog = Blog.create(blog_params)
          if @blog.save
            render json: "Blog created successfully. Please wait for the admin to publish it"
          else
            render json: "Blog creation unsuccessful! Please try again."
          end
        else
          render json: "You are not allowed to create a blog"
        end  
      end 

      def show
        if @blog.kept?
          render json: BlogSerializer.new(@blog).serializable_hash.to_json

        else 
          render json: "This blog has been deleted"
        end 
      end
      
      def destroy
        if @current_user.id == @blog.user_id && @blog.undiscarded?
            @blog.discard
            render json: "Blog has been deleted successfully"
        elsif @current_user.id != @blog.user_id
            render json: "You are not authorized to perform this action"
        else
            render json: "Blog has already been deleted" 
        end 
      end
      
      private

      def blog_params
        params.permit(:title,:body,:user_id,images:[])
      end 

      def set_blog
        @blog = Blog.find(params[:id])
      end 

    end
  end 
end  