Rails.application.routes.draw do
 
  devise_for :users
  root to: "home#index"

  get "up" => "rails/health#show", as: :rails_health_check

  resources :users
  resources :games
  
end