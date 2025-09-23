class PatientDashboardController < ApplicationController
  before_action :authenticate_user!

  def index
    @doctors = Doctor.includes(:category).all # Загружаем докторов с категориями
    @appointments = current_user.appointments.order(closed: :asc, date: :desc) # Открытые сверху
  end
end