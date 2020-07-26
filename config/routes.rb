Rails.application.routes.draw do
  root to: 'toppages#index'
  get 'abouts', to: 'abouts#index'
end
