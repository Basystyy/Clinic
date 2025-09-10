class PatientCabinetsController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_patient!

  def index
    @appointments = current_user.appointments.includes(:doctor)
  end

  private

  def authorize_patient!
    authorize! :access, :patient_cabinet
  end
end
