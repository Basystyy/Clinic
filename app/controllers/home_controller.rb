class HomeController < ApplicationController
  before_action :set_doctors, only: :index
  
  def login_as
    phone    = params[:phone]
    password = params[:password]

    user = AdminUser.find_by(phone: phone) ||
           Doctor.find_by(phone: phone)    ||
           User.find_by(phone: phone)

    if user && user.valid_password?(password)
      sign_in(user)

      if user.is_a?(AdminUser)
        redirect_to admin_root_path
      elsif user.is_a?(Doctor)
        redirect_to doctor_cabinets_path
      else
        redirect_to root_path
      end
    else
      flash[:alert] = "Неверный телефон или пароль"
      redirect_to root_path
    end
  end

  def logout
    sign_out(:user) if user_signed_in?
    sign_out(:doctor) if doctor_signed_in?
    sign_out(:admin_user) if admin_user_signed_in?
    redirect_to root_path, notice: "Logged out successfully"
  end

  private

  def set_doctors
    @doctors = Doctor.includes(:category).all
  end
end
