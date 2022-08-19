class Api::V1::BlogsController < Api::V1::ApiController
  skip_before_action :authenticate_request, only: [:index, :show]
  before_action :set_blog, only: [:show, :destroy]
  
  def index
    blogs = Blog.published
    render json: BlogSerializer.new(blogs), status: 200
  end
  
  def create
    if @current_user.author_user_type?
      blog = @current_user.blogs.create(blog_params)
      if blog.save
        render json: "Blog created successfully. Please wait for the admin to publish it", status: 200
      else
        render json: "Blog creation unsuccessful! Please try again.", status: 401
      end
    else
      render json: "You are not allowed to create a blog", status: 401
    end  
  end 
  
  def show
    if blog.kept?
      render json: BlogSerializer.new(blog), status: 200
    else 
      render json: "This blog has been deleted", status: 401
    end 
  end
  
  def destroy
    if @current_user.id == blog.user_id && blog.undiscarded?
      blog.discard
      render json: "Blog has been deleted successfully", status: 200
    elsif @current_user.id != blog.user_id
      render json: "You are not authorized to perform this action", status: 401
    else
      render json: "Blog has already been deleted", status: 401
    end 
  end
  
  private
    def blog_params
      params.permit(:title,:body,:user_id,images:[])
    end 

    def set_blog
      blog = Blog.find(params[:id])
    end 
end
  