Rails.application.routes.draw do
  root to: 'toppages#index'
  
  get 'abouts', to: 'abouts#index'
  
  get 'admins', to: 'admins#index'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  resources :posts
  
end
