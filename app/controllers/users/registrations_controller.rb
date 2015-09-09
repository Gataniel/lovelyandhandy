class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_permitted_parameters
  before_action :require_no_authentication, :require_session_omniauth,
                only: [:signup_finish, :social_link_confirm, :social_link_confirmation]
  skip_before_filter :store_location,
                     only: [:signup_finish, :social_link_confirm, :social_link_confirmation]

  def signup_finishing
    @user = User.new(user_params)
  end

  def signup_finish
    @user = User.new(user_params)
    if (@user_match = User.find_by(email: @user.email))
      create_social_network(@user_match)
    else
      if @user.save
        create_social_network(@user)
      else
        render :signup_finishing
      end
    end
  end

  def social_link_confirmation
    @user = User.find(params[:id])
  end

  def social_link_confirm
    @user = User.find(params[:id])
    if @user.valid_password?(params[:user][:password])
      create_social_network
    else
      @user.errors.add(:password, I18n.t('errors.messages.invalid'))
      render :social_link_confirmation
    end
  end

  protected

  # def build_resource(hash = nil)
  #   super
  #   @sign_up_resource = resource
  # end

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up).push(:first_name, :last_name)
  end

  private

  def user_params
    params.require(:user).permit(:email, :first_name, :last_name).merge(password: Devise.friendly_token[0, 10])
  end
  #
  # def user_password_params
  #   params.require(:user).permit(:current_password, :password, :password_confirmation)
  # end

  def create_social_network(user)
    user.user_social_networks.create(uid: session[:omniauth]['uid'], provider: session[:omniauth]['provider'])
    sign_in_and_redirect user, event: :authentication
    session.delete(:omniauth)
  end

  def require_session_omniauth
    fail ActionController::RoutingError.new('Not Found') unless session[:omniauth]
  end
end
