Rails.application.routes.draw do
  resources :products, only: %i[index]
  resources :products_searches, only: %i[create]
  resources :cart_items, only: %i[create]
end
