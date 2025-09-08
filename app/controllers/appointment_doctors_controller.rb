class AppointmentDoctorsController < ApplicationController
  load_and_authorize_resource
  before_action :authenticate_user!
  before_action :set_appointment_doctor, only: [:show, :edit, :update, :destroy]

  def index

  end

  def new
    @appointment_doctor = AppointmentDoctor.new(user: current_user)
  end

  def create
    @appointment_doctor = AppointmentDoctor.new(appointment_doctor_params.merge(user: current_user))
    if @appointment_doctor.save
      redirect_to appointment_doctors_path, notice: 'Appointment was successfully created.'
    else
      render :new
    end
  end

  def show

  end

  def edit

  end

  def update
    if @appointment_doctor.update(appointment_doctor_params)
      redirect_to @appointment_doctor, notice: 'Appointment was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @appointment_doctor.destroy
    redirect_to appointment_doctors_path, notice: 'Appointment was successfully destroyed.'
  end

  private

  def set_appointment_doctor
    @appointment_doctor = AppointmentDoctor.find(params[:id])
  end

  def appointment_doctor_params
    params.require(:appointment_doctor).permit(:doctor_id, :date)
  end
end