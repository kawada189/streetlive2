Rails.application.routes.draw do
    root 'posts#index'
  get '/posts/map',to:'posts#map'
  get '/auth/:provider/callback', to: 'sessions#create'
  get '/signout', to: 'sessions#destroy'

  resources :users do
    resource :relationships, only: [:create, :destroy]
    get :follows, on: :member # 追加
    get :followers, on: :member # 追加
  end

  resources :posts do
    resource :favorites, only: [:create, :destroy]
  end
 
  
end
