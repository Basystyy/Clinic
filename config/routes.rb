Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions' }
  devise_for :doctors, controllers: { sessions: 'doctors/sessions' }
  devise_for :admin_users, ActiveAdmin::Devise.config

  root "home#index"

  resources :doctors, :appointments

  get "up", to: "rails/health#show", as: :rails_health_check
  get '/patient_dashboard', to: 'patient_dashboard#index'
  get '/doctor_dashboard', to: 'doctor_dashboard#index'

  ActiveAdmin.routes(self)
end