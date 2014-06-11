Rails.application.routes.draw do
  resources :makes, only: [:index, :show]
end
