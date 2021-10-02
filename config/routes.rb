Rails.application.routes.draw do

  resources :weights, only: [:index, :edit, :create, :update, :destroy]

  resources :posts do
   resources :post_comments, only: [:create, :destroy]
   resource :favorites, only: [:create, :destroy]
   collection do
      get 'search'
    end
  end

  resource :users, only: [:edit,:update]
  get 'users/my_page', to: 'users#show'
  patch 'users/my_page', to: 'users#show'
  get'users/quit'
  patch 'users/out',to: "users#out"

  resources :diaries

  devise_for :users

  root to: 'homes#top'
end
