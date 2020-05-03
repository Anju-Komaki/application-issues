Rails.application.routes.draw do
  devise_for :users
  resources :users,only: [:show,:index,:edit,:update]
  resources :relationships, only:[:create, :destroy]
  resources :books do
    resource :favorites, only:[:create, :destroy]
    resource :book_comments, only:[:create, :destroy]
  end
  root 'home#top'
  get 'home/about' => 'home#about'
  get 'home/top'

  post 'follow/:id' => 'relationships#follow', as: 'follow' # フォローする
  post 'unfollow/:id' => 'relationships#unfollow', as: 'unfollow' # フォロー外す


end
