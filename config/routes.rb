Rails.application.routes.draw do
  root 'tweets#index'
  resources :users
  resources :tweets
  get '/sign_up' => 'users#new'
  post '/users' => 'users#create'
end
