Rails.application.routes.draw do
  root 'services#index'
  namespace :cities do
    resources :names, only: [:index, :show]
    resources :zipcodes, only: [:index, :show]
  end
end
