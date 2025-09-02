frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # Гость

    if user.admin?
      can :manage, :all # Админ может всё
    elsif user.doctor?
      can :read, User # Доктор видит пациентов
      can :update, Appointment, doctor_id: user.id # Доктор управляет своими записями
    else
      can :read, Doctor # Пациент видит врачей
      can :create, Appointment # Пациент может записаться
    end
  end
end
