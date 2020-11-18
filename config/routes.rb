Rails.application.routes.draw do
  root 'homes#top'
  devise_for :users
  get 'home/about' => 'homes#about', as: 'about'



  resources :users, only: [:show,:index,:edit,:update] do
    member do
      get :follow_users
      get :followers_users
    end
  end
  resources :books do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end

  post 'create/:id' => 'relationships#create', as: 'follow' # フォローする
  post 'destroy/:id' => 'relationships#destroy', as: 'unfollow' # フォロー外す


end