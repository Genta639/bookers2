Rails.application.routes.draw do
  get 'users/show'
  get 'home/about'
  root to: 'home#top'
  devise_for :users
  resources :books, only: [:new, :create, :index, :show, :destroy, :edit, :update]
  resources :users, only: [:show, :edit, :update, :index]
end
