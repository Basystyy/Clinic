class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= AdminUser.new # гость по умолчанию

    # -------------------------
    # Админ
    # -------------------------
    if user.is_a?(AdminUser)
      can :manage, :all              # полный доступ ко всем моделям
      can :access, :admin_cabinet    # виртуальный ресурс для кабинета админа

    # -------------------------
    # Доктор
    # -------------------------
    elsif user.is_a?(Doctor)
      can :read, User                          # просмотр информации о пациентах
      can :manage, Appointment, doctor_id: user.id # управление своими записями
      can :access, :doctor_cabinet            # виртуальный ресурс для кабинета доктора

    # -------------------------
    # Пациент
    # -------------------------
    elsif user.is_a?(User)
      can :read, Doctor                        # просмотр списка докторов
      can :create, Appointment                 # создание новых записей
      can :read, Appointment, user_id: user.id # просмотр своих записей
      can :access, :patient_cabinet           # виртуальный ресурс для кабинета пациента

    # -------------------------
    # Гость
    # -------------------------
    else
      can :read, Doctor                        # просмотр докторов без логина
      can :read, Category                      # просмотр категорий
    end
  end
end
