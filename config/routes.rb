Rails.application.routes.draw do
  resources :admins
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :user, only: [:create]
  resources :session, only: [:create]
end
