Rails.application.routes.draw do
  devise_for :users
  resources :users,only: [:show,:index,:edit,:update]
  resources :books
  root 'home#top'
  get 'home/about' => 'home#about'
  get 'home/top'
end
