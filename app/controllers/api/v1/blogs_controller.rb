module Api
  module V1
    class BlogsController < ApiController

      def index
        @blogs = Blog.all
      end 

    end
  end 
end  