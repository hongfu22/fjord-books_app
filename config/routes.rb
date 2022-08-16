Rails.application.routes.draw do
  devise_for :users
  # devise_for :users
  resources :books
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root :to => 'books#index'
  get '/users', to: 'users#index'
  get '/user/:id', to: 'users#show'
end
