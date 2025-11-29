Rails.application.routes.draw do
  devise_for :users
  get "pages/home"
  get "games/index"
  get "games/show"
  get "logs/index"
  get "logs/show"
  get "lists/index"

  resources :games do
    resources :reviews, only: [:new, :create]
  end
  resources :developers
  resources :publishers
  resources :logs
  resources :log_game
  resources :lists
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  root "pages#home"
end
