Rails.application.routes.draw do
  devise_for :users, :doctors, :admin_users

  ActiveAdmin.routes(self)

  root "home#index"

  post "/login_as", to: "home#login_as", as: :login_as
  delete "/logout", to: "home#logout", as: :logout

  resources :doctors, :appointments
  resources :patient_cabinets, only: [:index]
  resources :doctor_cabinets, only: [:index]
  resources :admin_users, only: [:new, :create, :index, :edit, :update, :destroy]


  get "up" => "rails/health#show", as: :rails_health_check
end

