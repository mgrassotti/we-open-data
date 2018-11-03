Rails.application.routes.draw do
  get '/gov_it' => 'gov_it/packages#index'
  namespace :gov_it do
    resources :packages, only: [:index, :show]
  end
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'
  
  root 'services#index'
  namespace :italian do
    namespace :cities do
      resources :names, only: [:index]
      resources :zipcodes, only: [:index]
    end
    resources :cities, only: [:index, :show]
  end
end
