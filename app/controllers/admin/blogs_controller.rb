class Admin::BlogsController < ApplicationController
  def index
    @blogs = Blog.all
  end

  def edit
  end 

  def destroy
  end 
  
end 