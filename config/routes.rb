Rails.application.routes.draw do
  get "home/index"
  get "withdrawals/new"
  get "withdrawals/create"
  get "withdrawals/index"
  get "deposits/new"
  get "deposits/create"
  get "deposits/index"
  namespace :admin do
    get "deposits/index"
    get "deposits/approve"
  end
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Defines the root path route ("/")

  devise_for :users
  devise_for :admins

  resources :deposits, only: [:new, :create, :index]
  resources :withdrawals, only: [:new, :create, :index]

  namespace :admin do
    resources :deposits, only: [:index] do
      member do
        patch :approve
      end
    end
  end
  root 'home#index'
  # root "posts#index"
end
