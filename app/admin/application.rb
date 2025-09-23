module ActiveAdmin
  class ApplicationController < ::ActiveAdmin::BaseController
    def after_sign_in_path_for(resource)
      case resource.class.name
      when "AdminUser"
        admin_root_path
      when "User"
        "/patient_dashboard"
      when "Doctor"
        "/doctor_dashboard"
      else
        admin_root_path
      end
    end

    def after_sign_out_path_for(resource_or_scope)
      root_path # Редирект на стартовую страницу после логаута из админки
    end
  end
end