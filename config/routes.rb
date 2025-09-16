Rails.application.routes.draw do
  # Единый вход
  devise_scope :user do
    get  "sign_in",  to: "sessions#new",     as: :new_session
    post "sign_in",  to: "sessions#create",  as: :session
    delete "sign_out", to: "sessions#destroy", as: :destroy_session
  end

  # Регистрация только для пациентов
  devise_for :users, skip: [:sessions]
  
  # Для докторов и админов — только учётка через админку
  devise_for :doctors, skip: [:registrations, :sessions]
  devise_for :admin_users, ActiveAdmin::Devise.config.merge(skip: [:registrations, :sessions])
  ActiveAdmin.routes(self)

  root "home#index"

  get "up" => "rails/health#show", as: :rails_health_check
end
