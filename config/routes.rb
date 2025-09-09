Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  devise_for :users
  devise_for :doctors
  root "home#index"
  get 'login_as', to: 'home#login_as'
  namespace :admin do
    resources :users
    resources :doctors
    resources :admin_users
  end
  resources :doctors
  resources :appointment_doctors

  get "up" => "rails/health#show", as: :rails_health_check
end