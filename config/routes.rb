Rails.application.routes.draw do
 
  devise_for :users
  root to: "home#index"

  get "up" => "rails/health#show", as: :rails_health_check

  resources :users, only: [:index, :show, :edit, :update] do
    member do
      get :follows, :followers
    end
      resources :relationships, only: [:create, :destroy]
  end
    
  resources :games
  resources :newgames

  resources :posts do
    resources :post_comments, only: [:create, :destroy]
  end

  resources :items do
    collection do
        get 'search'
    end
  end
  
end
