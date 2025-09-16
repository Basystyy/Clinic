class DoctorCabinetsController < ApplicationController
  before_action :authenticate_doctor!
  before_action -> { authorize_cabinet!(:doctor_cabinet) }

  def index
    @open_appointments = current_doctor.appointments.where(closed: false).includes(:user, doctor: :category)
    @closed_appointments = current_doctor.appointments.where(closed: true).includes(:user, doctor: :category)
  end
end
