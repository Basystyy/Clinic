class PatientDashboardController < ApplicationController
  before_action :authenticate_user!

  def index
    @doctors = Doctor.includes(:category).all

    @open_appointments     = current_user.appointments
                                         .where(closed: false,
                                                archived: false)
                                                .order(date: :desc)
    @closed_appointments   = current_user.appointments
                                         .where(closed: true,
                                                archived: false)
                                                .order(date: :desc)
    @archived_appointments = current_user.appointments
                                         .where(archived: true)
                                         .order(date: :desc)
  end
end