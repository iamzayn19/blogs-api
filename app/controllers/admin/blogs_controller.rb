class Admin::BlogsController < ApplicationController
  def index
    @blogs = Blog.all
  end

  def show
    @blog = Blog.find(params[:id])
  end

  def change_status
    @blog = Blog.find(params[:blog_id])
    @blog.status = params[:status]
    @blog.save
    redirect_to request.referrer
  end
  
end 