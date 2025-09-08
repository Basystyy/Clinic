Rails.application.routes.draw do
  devise_for :users
  root "home#index"
  get 'login_as', to: 'home#login_as'
  namespace :admin do
    resources :users
    resources :doctors
  end
  resources :doctors
  resources :appointment_doctors

  get "up" => "rails/health#show", as: :rails_health_check
end