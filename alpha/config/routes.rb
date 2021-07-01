Rails.application.routes.draw do
  root to: "welcome#index"
  resources :settings
  resources :transitions
  resources :orders
end
