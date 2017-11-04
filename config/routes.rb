Rails.application.routes.draw do
  get 'home/index'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#index"

  post 'import', to: 'home#import'
  get 'import_purchase_with_success/:id', to: 'import_purchases#import_purchase_with_success', as: :import_purchase_with_success
  get 'import_purchase_with_error/:id', to: 'import_purchases#import_purchase_with_error', as: :import_purchase_with_error

  require 'sidekiq/web'
  authenticate :user do
    mount Sidekiq::Web => '/sidekiq'
  end
end
