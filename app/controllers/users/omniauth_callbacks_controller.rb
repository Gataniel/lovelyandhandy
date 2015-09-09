class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  skip_before_filter :store_location

  def self.provides_callback_for(provider)
    class_eval %{
      def #{provider}
        @user = User.find_or_init_for_oauth(env["omniauth.auth"], current_user)
        if @user.new_record? && @user.invalid?
          session[:omniauth] = env["omniauth.auth"].except('extra')
          redirect_to signup_finishing_path(user: @user.as_json(only: [:first_name, :last_name, :email]))
        else
          @user.save if @user.new_record?
          @user.user_social_networks.find_or_create_by(uid: env["omniauth.auth"].uid, provider: env["omniauth.auth"].provider)
          sign_in_and_redirect @user, event: :authentication
          set_flash_message(:notice, :success, kind: "#{provider}".capitalize) if is_navigational_format?
        end
      end
    }
  end

  [:twitter, :facebook, :vkontakte, :google].each do |provider|
    provides_callback_for provider
  end
end
