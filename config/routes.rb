Rails.application.routes.draw do
  # get 'users/index'
  # get 'users/show'
  # get 'users/new'
  # get 'users/edit'
  # get 'users/create'
  # get 'users/update'
  # get 'users/destroy'
devise_for :users
resources :users

post 'users/product'
post 'users/faucet'
root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
