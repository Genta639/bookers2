Rails.application.routes.draw do
  get 'book_comments/create'
  get 'book_comments/destroy'
  get 'users/show'
  get 'home/about'
  root to: 'home#top'
  devise_for :users
  resources :books, only: [:new, :create, :index, :show, :destroy, :edit, :update] do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end
  resources :users, only: [:show, :edit, :update, :index]
end
