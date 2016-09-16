Rails.application.routes.draw do
  resources :bars, only: [:index]
  root 'bars#index'
end
