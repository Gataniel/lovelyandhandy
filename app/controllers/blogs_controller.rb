class BlogsController < ApplicationController
  layout 'blogs'
  
  def index
    @blogs = Blog.all
  end

  def show
  end
end
