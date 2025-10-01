class AppointmentsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]
  before_action :set_appointment, only: [:update]

  def create
    @appointment = current_user.appointments.build(appointment_params)

    if @appointment.save
      redirect_to patient_dashboard_path,
                  notice: "Appointment booked successfully!"
    else
      redirect_to patient_dashboard_path,
                  alert: @appointment.errors.full_messages.to_sentence
    end
  end

  def destroy
    @appointment = current_user.appointments.find(params[:id])
    if @appointment.destroy
      redirect_to patient_dashboard_path,
            notice: "Appointment canceled!"
    else
      redirect_to patient_dashboard_path,
            alert: "Unable to cancel appointment."
    end
  end

  def update
    if @appointment.update(appointment_params)
      redirect_to doctor_dashboard_path,
                  notice: "Appointment updated successfully."
    else
      redirect_to doctor_dashboard_path,
                  alert: "Failed to update appointment."
    end
  end

  private

  def set_appointment
    @appointment = Appointment.find(params[:id])
  end
  
  def appointment_params
    params.require(:appointment).permit(:doctor_id, :date,
                                        :recommendation, :closed)
  end
end
