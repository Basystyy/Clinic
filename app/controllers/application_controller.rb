class ApplicationController < ActionController::Base
  before_action :set_role

  def after_sign_in_path_for(resource)
    case resource
    when User
      patient_dashboard_path
    when Doctor
      doctor_dashboard_path
    when AdminUser
      admin_root_path
    else
      root_path
    end
  end

  private

  def set_role
    @role = params[:role]
  end
end
