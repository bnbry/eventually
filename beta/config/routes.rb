Rails.application.routes.draw do
  root to: "welcome#index"
  resources :carts
  resources :transitions
end
