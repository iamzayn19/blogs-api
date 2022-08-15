module Api
  module V1
    class BlogsController < ApiController
      skip_before_action :authenticate_request, only: [:index, :show]
      before_action :set_blog, only: [:show, :destroy]
      
      def index
        @blogs = Blog.all
        render json: @blogs
      end
      
      def create
        if @current_user.user_type == "public"
          render json: "You are not allowed to create a blog"
        else
          params[:user_id] = @current_user.id
          @blog = Blog.create(blog_params)
          if @blog.save
            render json: "Blog created successfully. Please wait for the admin to publish it"
          else
            render json: "Blog creation unsuccessful! Please try again."
          end
        end  
      end 

      def show
        render json: @blog, status: :ok
      end
      
      def destroy
        render json: "Destroy called", status: :ok
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