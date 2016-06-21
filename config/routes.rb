RottenMangoes::Application.routes.draw do

  resources :movies do
    resource :reviews, only: [:new, :create]
  end
  resources :users, only: [:new, :create]
  resources :sessions, only: [:new, :create, :destroy]
  root to: 'movies#index'

  namespace :admin do
    resources :users
  end
end