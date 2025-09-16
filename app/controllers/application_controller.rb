class ApplicationController < ActionController::Base
  layout :determine_layout

  rescue_from CanCan::AccessDenied do |exception|
    flash[:alert] = "Access denied: #{exception.message}"
    redirect_to root_path
  end

  private

  def determine_layout
    if devise_controller? && !admin_user_signed_in?
      "active_admin_logged_out"
    else
      "application"
    end
  end
end
