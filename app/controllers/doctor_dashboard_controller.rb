class DoctorDashboardController < ApplicationController
  before_action :authenticate_doctor!

  def index
    @open_appointments = current_doctor.appointments
                                       .where(closed: false)
                                       .order(date: :desc)

    @closed_appointments = current_doctor.appointments
                                         .where(closed: true)
                                         .order(date: :desc)
  end
end