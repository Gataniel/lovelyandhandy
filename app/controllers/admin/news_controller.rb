class Admin::NewsController < Admin::ApplicationController
  before_action :find_new, only: %i(edit update destroy)

  def index
    @news = New.all
  end

  def new
    @new = New.new
  end

  def create
    @new = New.new(new_params)
    if @new.save
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
    params.require(:new).permit(:title, :description)
  end

  def find_new
    @new = New.find(params[:id])
  end
end
