class Admin::ApplicationController < ActionController::Base
  before_action :authenticate_admin!
  layout 'admin'

  protected

  def authenticate_admin!
    redirect_to root_path unless current_user.try(:admin?)
  end
end
