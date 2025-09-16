class PatientCabinetsController < ApplicationController
  before_action :authenticate_user!
  before_action -> { authorize_cabinet!(:patient_cabinet) }

  def index
    @appointments = current_user.appointments.includes(:doctor)
  end
end
