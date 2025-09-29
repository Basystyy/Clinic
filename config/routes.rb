Rails.application.routes.draw do
  root "home#index"

  devise_for :users

  devise_for :doctors, skip: [:registrations]

  devise_for :admin_users, ActiveAdmin::Devise.config.merge(
    controllers: {sessions: "admin/sessions"}
  )

  get '/patient_dashboard', to: 'patient_dashboard#index'
  get '/doctor_dashboard', to: 'doctor_dashboard#index'

  resources :appointments, only: [:create, :update, :destroy]

  ActiveAdmin.routes(self)
end
