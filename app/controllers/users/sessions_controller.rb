class Users::SessionsController < Devise::SessionsController
  def after_sign_in_path_for(resource)
    "/patient_dashboard" # Кастомная страница для пациента
  end
end