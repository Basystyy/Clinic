class ApplicationController < ActionController::Base
  # Подменим current_user для CanCanCan
  def current_ability
    if current_admin_user
      Ability.new(current_admin_user)
    elsif current_doctor
      Ability.new(current_doctor)
    elsif current_user
      Ability.new(current_user)
    else
      Ability.new(nil)
    end
  end
end
