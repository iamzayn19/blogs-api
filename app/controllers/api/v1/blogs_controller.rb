module Api
  module V1
    class BlogsController < ApiController
      skip_before_action :authenticate_request, only: [:index, :show]
      before_action :set_blog, only: [:show, :destroy]
      
      def index
        @blogs = Blog.all
        render json: @blogs
      end
      
      def show
        render json: @blog, status: :ok
      end
      
      def destroy
        render json: "Destroy called", status: :ok
      end
      
      private

      def set_blog
        @blog = Blog.find(params[:id])
      end 

    end
  end 
end  