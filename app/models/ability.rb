class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # Гость
    user.role ||= 'patient' # По умолчанию пациент

    if user.admin?
      can :manage, :all
    elsif user.doctor?
      can :read, AppointmentDoctor, doctor_id: user.doctors.pluck(:id)
      can :manage, AppointmentDoctor, doctor_id: user.doctors.pluck(:id) # manage включает edit
    else
      can :read, AppointmentDoctor, user_id: user.id
      can :create, AppointmentDoctor
    end
  end
end