class Doctors::SessionsController < Devise::SessionsController
  def after_sign_in_path_for(resource)
    "/doctor_dashboard" # Кастомная страница для доктора
  end
end