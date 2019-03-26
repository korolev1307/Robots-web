Rails.application.routes.draw do
  root 'goods#index'
  resources :paymenttype
  resources :choosedelivery
  resources :deliverycity
  resources :good_categories
  devise_for :users, controllers: { registrations: 'users/registrations' }
  resources :goods
  resources :users
  resources :order_goods
  resource :cart, only: [:show, :create]
  resources :admin
  resources :orderinfo
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end