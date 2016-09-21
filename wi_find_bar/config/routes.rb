Rails.application.routes.draw do
  resources :bars, only: [:index, :show]
  root 'bars#index'
end
