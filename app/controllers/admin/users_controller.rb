class Admin::UsersController < Admin::ApplicationController
  before_action :find_user, only: %i(edit update destroy)

  def index
    @q = User.search(params[:q])
    @users = @q.result(distinct: true)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to action: :index, notice: 'User successfully created'
    else
      render :new
    end
  end

  def edit; end

  def update
    if @user.update(user_params)
      redirect_to action: :index, notice: 'User successfully updated'
    else
      render :edit
    end
  end

  def destroy
    if @user.destroy
      redirect_to action: :index, notice: 'User successfully destroyed'
    else
      redirect_to action: :index, alert: 'Something went wrong'
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end

  def find_user
    @user = User.find(params[:id])
  end
end
