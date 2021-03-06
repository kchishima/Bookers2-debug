Rails.application.routes.draw do
   devise_for :users
  resources :users,only: [:show,:index,:edit,:update]
  resources :books do
  resource :favorites, only: [:create, :destroy]
  resources :book_comments, only: [:create, :destroy]
  end
  root 'homes#top'
  get 'home/about' => 'homes#about'
  resources :users do
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
    get :followings, on: :member
    get :followers, on: :member
  end
    get 'search' => 'searches#search'
end
