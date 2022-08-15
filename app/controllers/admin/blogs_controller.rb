class Admin::BlogsController < ApplicationController
  def index
    @blogs = Blog.all
  end

  def edit
    @blog = Blog.find(params[:id])
  end 

  def update
  end 

  def change_status
    render json: params
  end

  def destroy
    
  end 
  
end 