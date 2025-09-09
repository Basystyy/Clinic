class Ability
  include CanCan::Ability

  def initialize(user)
    if user.is_a?(AdminUser)
      can :manage, :all
    elsif user.is_a?(Doctor)
      can :read, User
      can :manage, AppointmentDoctor
    elsif user.is_a?(User)
      can :read, User
      can :create, AppointmentDoctor
    else
      can :read, :all
    end
  end
end