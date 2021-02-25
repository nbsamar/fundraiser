Rails.application.routes.draw do
  root 'users#new'
  resources :campaigns
  resources :users
  resources :profiles, only: [:show, :edit]
end
