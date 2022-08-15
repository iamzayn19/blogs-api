class Admin::BlogsController < ApplicationController
  def index
    @blogs = Blog.where(status: "unpublished")
  end 
end 