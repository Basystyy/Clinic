class AppointmentsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  before_action :set_doctor, only: [:new, :create]

  def new
    if @doctor.nil?
      redirect_to patient_dashboard_path, alert: "Please select a doctor."
    else
      @appointment = @doctor.appointments.build
    end
  end

  def create
    @appointment = @doctor.appointments.build(appointment_params.merge(user_id: current_user.id))
    if @appointment.save
      redirect_to patient_dashboard_path, notice: "Appointment booked successfully!"
    else
      render :new
    end
  end

  private

  def set_doctor
    @doctor = Doctor.find_by(id: params[:doctor_id]) if params[:doctor_id].present?
  rescue ActiveRecord::RecordNotFound
    @doctor = nil
  end

  def appointment_params
    params.require(:appointment).permit(:date, :doctor_id)
  end
end