Rails.application.routes.draw do
  resources :bars, only: [:index, :show], param: :name, format: false
  root 'bars#index'
end
