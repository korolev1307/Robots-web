Rails.application.routes.draw do
  root 'goods#index'
  devise_for :users
  resources :goods
  resources :users
  get 'users', to: 'users#show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end