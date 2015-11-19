class Admin::ApplicationController < ActionController::Base
  before_action :authenticate_admin!

  layout 'admin'

  protected

  def authenticate_admin!
    # redirect_to root_path unless current_user.try(:admin?)
    authenticate_or_request_with_http_basic do |username, password|
      username == 'gataniel' && password == 'gataspam'
    end
  end
end
