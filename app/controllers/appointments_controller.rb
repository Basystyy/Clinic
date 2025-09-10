class AppointmentsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  def index
    @appointments = current_user.appointments
  end

  def new
    @appointment = Appointment.new(doctor_id: params[:doctor_id])
  end

  def create
    @appointment = current_user.appointments.build(appointment_params)
    if @appointment.save
      redirect_to patient_cabinet_path, notice: "Appointment booked successfully"
    else
      render :new
    end
  end

  private

  def appointment_params
    params.require(:appointment).permit(:doctor_id, :date)
  end
end