Rails.application.routes.draw do
  root 'tweets#index'
  resources :user
end
