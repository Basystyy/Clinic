Rails.application.routes.draw do
  devise_for :users, :doctors, :admin_users

  ActiveAdmin.routes(self)

  root to: "admin/dashboard#index"

  get "up" => "rails/health#show", as: :rails_health_check
end
