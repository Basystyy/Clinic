class ApplicationController < ActionController::Base
  before_action :set_role
  private
  def set_role
    @role = params[:role]
  end
end