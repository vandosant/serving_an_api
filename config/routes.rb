Rails.application.routes.draw do
  resources :cars, except: [:new, :edit]
  resources :makes, only: [:index, :show]
end
