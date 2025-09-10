Rails.application.routes.draw do

  devise_for :users, :doctors, :admin_users

  root "home#index"

  resources :doctors, :appointments
  resources :patient_cabinets, only: [:index]
  resources :doctor_cabinets, only: [:index]
  resources :admin_cabinets, only: [:index]

  get 'login_as', to: 'home#login_as'
  
  get "up" => "rails/health#show", as: :rails_health_check
end
