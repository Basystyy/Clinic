class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def authenticate_admin!
    authenticate_user!
    unless current_user && current_user.admin?
      flash[:alert] = "You must be an admin to access this page."
      redirect_to root_path
    end
  end
end
