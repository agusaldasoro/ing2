Rails.application.routes.draw do
  resources :bars, only: [:index]
end
