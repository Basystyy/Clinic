class ApplicationController < ActionController::Base
  # Центральный rescue для CanCanCan
  rescue_from CanCan::AccessDenied do |exception|
    flash[:alert] = "Access denied: #{exception.message}"
    redirect_to root_path
  end

  private

  # Универсальный метод для вызова authorize! с нужным ресурсом
  def authorize_cabinet!(cabinet)
    authorize! :access, cabinet
  end
end
