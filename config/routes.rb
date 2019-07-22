Rails.application.routes.draw do
  root 'posts#index'

  get 'posts/show'

  get 'posts/new'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/auth/:provider/callback', to: 'sessions#create'
  #get '/logout', to: 'sessions#destroy'
  get '/signout', to: 'sessions#destroy'
  
end
