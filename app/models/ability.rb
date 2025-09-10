class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= AdminUser.new
    
    # Админ
    if user.is_a?(AdminUser)
      can :manage, :all
      can :access, :admin_cabinet

    # Доктор
    elsif user.is_a?(Doctor)
      can :read, User
      can :manage, AppointmentDoctor, doctor_id: user.id
      can :access, :doctor_cabinet

    # Пациент
    elsif user.is_a?(User)
      can :read, Doctor
      can :create, AppointmentDoctor
      can :read, AppointmentDoctor, user_id: user.id
      can :access, :patient_cabinet

    # Гость
    else
      can :read, Doctor
      can :read, Category
    end
  end
end
