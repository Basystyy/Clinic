class AdminCabinetsController < ApplicationController
  before_action :authenticate_admin_user!
  before_action :authorize_admin!

  def index
    @users = User.all
    @doctors = Doctor.all
  end

  private

  def authorize_admin!
    authorize! :access, :admin_cabinet
  end
end
