Rails.application.routes.draw do
  root "home#index"

  # Devise для пациентов
  devise_for :users

  # Devise для докторов (только вход, без регистрации)
  devise_for :doctors, skip: [:registrations]

  # Devise для админов (через ActiveAdmin)
  devise_for :admin_users, ActiveAdmin::Devise.config

  # Кабинеты
  get '/patient_dashboard', to: 'patient_dashboard#index'
  get '/doctor_dashboard', to: 'doctor_dashboard#index'

  resources :appointments, only: [:create, :update, :destroy]

  # ActiveAdmin
  ActiveAdmin.routes(self)
end
