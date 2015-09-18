class BlogsController < ApplicationController
  layout 'blogs'

  def index
    @blogs = Blog.all.page(params[:page]).per(10)
  end

  def show
    @blog = Blog.find(params[:id])
  end
end
