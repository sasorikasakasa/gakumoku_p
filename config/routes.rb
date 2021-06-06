Rails.application.routes.draw do

  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :users

  resources :groups do
    member do
      get :followers
      get :members
      get :events
      post :follow_status_update
      post :join_status_update
    end
  end

  resources :events do
    member do
      post :apply_status_update
      get :applies
    end
  end
end

