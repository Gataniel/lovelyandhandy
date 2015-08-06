class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_permitted_parameters
  before_action :require_no_authentication, :require_session_omniauth,
                only: [:signup_finish, :signup_finishing, :social_link_confirm, :social_link_confirmation]
  skip_before_filter :store_location,
                     only: [:signup_finish, :signup_finishing, :social_link_confirm, :social_link_confirmation]

  def signup_finishing
    @user = User.new(user_params)
  end

  def signup_finish
    @user = User.new(user_params)
    if @user_match = User.find_by(email: user_params[:email])
      redirect_to social_link_confirmation_path(@user_match)
    else
      if @user.save
        create_social_link(notice = I18n.t('devise.registrations.signed_up_but_unconfirmed'))
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
      @user.update_column(:confirmed_at, nil)
      create_social_link(notice = I18n.t('linked_provider', provider: session[:omniauth].provider))
    else
      @user.errors.add(:password, I18n.t('errors.messages.invalid'))
      render :social_link_confirmation
    end
  end

  def update_password
    @user = current_user
    if @user.update_with_password(user_password_params)
      # Sign in the user by passing validation in case their password changed
      sign_in @user, bypass: true
      flash[:notice] = I18n.t('devise.passwords.updated_not_active')
    end
  end

  protected

  def build_resource(hash = nil)
    super
    @sign_up_resource = resource
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up).push(:first_name, :last_name)
  end

  private

  def user_params
    params.require(:user).permit(:email, :first_name, :last_name).merge(password: Devise.friendly_token[0, 20])
  end

  def user_password_params
    params.require(:user).permit(:current_password, :password, :password_confirmation)
  end

  def create_social_link(notice)
    @user.social_links.create(uid: session[:omniauth].uid, provider: session[:omniauth].provider)
    @user.send_confirmation_instructions
    redirect_to new_user_session_path, notice: notice
    session.delete(:omniauth)
  end

  def require_session_omniauth
    fail ActionController::RoutingError.new('Not Found') unless session[:omniauth]
  end
end
