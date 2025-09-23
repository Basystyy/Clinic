class Ability
  include CanCan::Ability

  def initialize(user)
    if user.is_a?(AdminUser)
      can :manage, :all
    elsif user.is_a?(Doctor)
      can :read, Appointment, doctor_id: user.id
      can :update, Appointment, doctor_id: user.id # Для комментирования
    elsif user.is_a?(User)
      can :read, Doctor
      can :create, Appointment
      can :read, Appointment, user_id: user.id
      can :destroy, Appointment, user_id: user.id, closed: false # Только открытые
    end
  end
end