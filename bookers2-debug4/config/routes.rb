Rails.application.routes.draw do
  devise_for :users
  resources :users,only: [:show,:index,:edit,:update] do
    member do
      get :follower, :followed
    end
  end
  resources :relationships, only:[:create, :destroy]
  resources :books do
    resource :favorites, only:[:create, :destroy]
    resource :book_comments, only:[:create, :destroy]
  end
  root 'home#top'
  get 'home/about' => 'home#about'
  get 'home/top'

  post 'follow/:id' => 'relationships#create', as: 'follow' # フォローする
  post 'unfollow/:id' => 'relationships#destroy', as: 'unfollow' # フォロー外す

  resources :search, only:[:search]

  get 'search' => 'search#search'


end
