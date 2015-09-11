class BlogsController < ApplicationController
  def index
    @blogs = Blog.all
  end

  def show
  end
end
