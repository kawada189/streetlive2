Rails.application.routes.draw do
  root 'posts#index'

  get '/auth/:provider/callback', to: 'sessions#create'
  get '/signout', to: 'sessions#destroy'

  resource :users
  resources :posts
 
  
end
