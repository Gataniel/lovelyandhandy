class Admin::BlogsController < Admin::ApplicationController
  before_action :find_new, only: %i(edit update destroy)

  def index
    @blogs = Blog.all
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = Blog.new(new_params)
    if @blog.save
      redirect_to action: :index, notice: 'New successfully created'
    else
      render :new
    end
  end

  def edit; end

  def update

  end

  def destroy

  end

  private

  def new_params
    params.require(:new).permit!
  end

  def find_new
    @blog = Blog.find(params[:id])
  end
end
