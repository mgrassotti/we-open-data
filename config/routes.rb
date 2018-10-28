Rails.application.routes.draw do
  root 'services#index'
  namespace :italy do
    resources :cities, only: :index
    namespace :cities do
      resources :names, only: [:index, :show]
      resources :zipcodes, only: [:index, :show]
    end
  end
end
