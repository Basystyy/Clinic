class DoctorsController < ApplicationController

  before_action :set_doctor, only: [:show, :edit, :update, :destroy]

  def index
    @doctors = Doctor.all
  end

  def show
    unless @doctor
      redirect_to doctors_path, alert: 'Doctor not found.'
    end
  end

  def new
    @doctor = Doctor.new
  end

  def edit

  end

  def create
    @doctor = Doctor.new(doctor_params)
    if @doctor.save
      redirect_to @doctor, notice: 'Doctor was successfully created.'
    else
      render :new
    end
  end

  def update
    if @doctor.update(doctor_params)
      redirect_to @doctor, notice: 'Doctor was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @doctor.destroy
    respond_to do |format|
      format.html { redirect_to doctors_path, notice: 'Doctor was successfully destroyed.' }
    end
  end

  private

  def set_doctor
    @doctor = Doctor.find_by(id: params[:id])
    redirect_to doctors_path, alert: 'Doctor not found.' unless @doctor
  rescue ActiveRecord::RecordNotFound
    redirect_to doctors_path, alert: 'Doctor not found.'
  end

  def doctor_params
    params.require(:doctor).permit(:name, :specialty, :phone, :category_id)
  end
end