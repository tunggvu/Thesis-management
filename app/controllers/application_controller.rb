class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  def logged_in_user
    unless logged_in?
      redirect_to login_path
    end
  end

  def admin?
    redirect_to admin_root_path if current_user.admin?
  end
end
