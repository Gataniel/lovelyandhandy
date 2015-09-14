class Admin::BlogsController < Admin::ApplicationController
  before_action :find_new, only: %i(edit update destroy)

  def index
    @q = Blog.search(params[:q])
    @blogs = @q.result(distinct: true)
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = Blog.new(blog_params)
    if @blog.save
      redirect_to action: :index, notice: 'Blog successfully created'
    else
      render :new
    end
  end

  def edit; end

  def update
    if @blog.update(blog_params)
      redirect_to action: :index, notice: 'Blog successfully updated'
    else
      render :edit
    end
  end

  def destroy
    if @blog.destroy
      redirect_to action: :index, notice: 'Blog successfully destroyed'
    else
      redirect_to action: :index, notice: 'Something whent wrong'
    end
  end

  private

  def blog_params
    params.require(:blog).permit!
  end

  def find_new
    @blog = Blog.find(params[:id])
  end
end
