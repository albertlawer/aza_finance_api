Rails.application.routes.draw do
  resources :transactions, only: [:index, :show, :create, :update]
end
