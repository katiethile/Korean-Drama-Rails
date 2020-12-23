Rails.application.routes.draw do

  resources :dramas do
    resources :reviews, only: [:new, :show]
  end

  resources :dramas 
  resources :users
  resources :reviews 

  get '/auth/facebook/callback', to: 'sessions#create_with_fb'

  get '/', to: 'sessions#home'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
