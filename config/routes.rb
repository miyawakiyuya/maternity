Rails.application.routes.draw do

  resources :weights, only: [:index, :edit, :create, :update, :destroy]

  resources :posts do
   resources :post_comments, only: [:create, :destroy]
   resource :favorites, only: [:create, :destroy]
   collection do
      get 'search'
    end
  end

  resource :users, only: [:edit,:update] do
    collection do
      get :my_page, to: 'users#show'
      patch :my_page, to: 'users#show'
      get :quit
      patch :out,to: "users#out"
      get :new ,to: "users#new"
    end
  end

  resources :diaries

  devise_for :users

  root to: 'homes#top'
end
