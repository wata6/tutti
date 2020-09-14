Rails.application.routes.draw do
  root to: 'toppages#index'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  get 'posts/new', to: 'posts#new'
  get 'signup', to: 'users#new'
  post 'orchestras/new', to: 'orchestras#new'
  resources :users, only: [:show, :new, :create, :edit, :update]do
    member do
      get :likes
      get :posts
    end
  end
  
  resources :posts, only: [:index, :new, :create, :destroy]
  resources :favorites, only: [:create, :destroy]
  resources :orchestras, only: [:show, :new, :create, :edit, :update]
  resources :messages, only: [:create]
  resources :rooms, only: [:index,:create,:show,:destroy]
end
