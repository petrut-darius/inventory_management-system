Rails.application.routes.draw do
  root "welcome#index"
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")

  resources :locations, only: [ :new, :create, :show, :index ]
  resources :products, only: [ :new, :create, :show, :index ]
  resources :inventory_items, only: [ :new, :create, :show, :index ]
  resources :suppliers, only: [ :new, :create, :show, :index ]
  resources :purchase_orders, only: [ :new, :create, :show, :index ]
  resources :purchase_order_items, only: [ :new, :create, :show, :index ]
end
