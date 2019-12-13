Rails.application.routes.draw do
  
  get 'topics/new'

  get 'sessions/new'

  root 'pages#index'
  get 'pages/help'
  
  get    '/login',  to: 'sessions#new'
  post   '/login',  to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get 'signup', to: 'users#new'
  resources :users, only: [:index, :show, :new, :create] do
    member do
      get :followings
      get :followers
      get :likes
    end
  end

  resources :users
  resources :topics
  resources :microposts, only: [:create, :destroy]
  
  get 'favorites/index'
  post '/favorites', to: 'favorites#create'
  delete '/favorites', to: 'favorites#destroy'
  
  delete 'favorites/:id' => 'favorites#destroy'
  
  delete 'topics/:id' => 'topics#destroy'
  
  get 'image_data/show' => 'image_data#show', :as => :show_image
end