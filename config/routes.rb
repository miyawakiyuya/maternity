Rails.application.routes.draw do

  resource :users, only: [:edit,:update]
  get 'users/my_page', to: 'users#show'
  patch 'users/my_page', to: 'users#show'
  get'users/quit'
  patch 'users/out',to: "users#out"

  resources :diaries

  devise_for :users

  root to: 'homes#top'
end
