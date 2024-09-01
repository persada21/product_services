Rails.application.routes.draw do
  resources :products
  resources :users

  mount ActionCable.server => "/cable"
end
