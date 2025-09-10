class DoctorCabinetsController < ApplicationController
  before_action :authenticate_doctor!
  before_action :authorize_doctor!

  def index
    @open_appointments = current_doctor.appointments.where(closed: false).includes(:user, doctor: :category)
    @closed_appointments = current_doctor.appointments.where(closed: true).includes(:user, doctor: :category)
  end

  private

  def authorize_doctor!
    authorize! :access, :doctor_cabinet
  end
end
