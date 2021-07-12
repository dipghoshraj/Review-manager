Rails.application.routes.draw do
  
  resources :dishes do 
    collection do
      post :reviews
      get :fetchreviews
    end
  end


  resources :resturants do
    collection do
      post :reviews
      get :fetchreviews
    end
  end


  resources :admins

  
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :user, only: [:create, :show]

  resources :session, only: [:create] do 
    collection do 
      post :admin
    end
  end

end
