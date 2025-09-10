class HomeController < ApplicationController
  
  def index
    @doctors = Doctor.all.includes(:category)
  end

  def login_as
    phone = params[:phone]

    if (admin = AdminUser.find_by(phone: phone))
      sign_in(:admin_user, admin)
      redirect_to admin_cabinets_path, notice: "Вошли как администратор"
    elsif (doctor = Doctor.find_by(phone: phone))
      sign_in(:doctor, doctor)
      redirect_to doctor_cabinets_path, notice: "Вошли как врач"
    elsif (user = User.find_by(phone: phone))
      sign_in(:user, user)
      redirect_to patient_cabinets_path, notice: "Вошли как пациент"
    else
      redirect_to root_path, alert: "Пользователь с таким телефоном не найден"
    end
  end
end
