Rails.application.routes.draw do
  root 'services#index'
  namespace :italy do
    namespace :cities do
      resources :names, only: [:index]
      resources :zipcodes, only: [:index]
    end
    resources :cities, only: [:index, :show]
  end
end
