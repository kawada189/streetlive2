Rails.application.routes.draw do
  get 'favorites/create'

  get 'favorites/destroy'

  root 'posts#index'
  get '/posts/map',to:'posts#map'
  get '/auth/:provider/callback', to: 'sessions#create'
  get '/signout', to: 'sessions#destroy'

  resource :users
  resources :posts do
    resource :favorites, only: [:create, :destroy]
  end
 
  
end
