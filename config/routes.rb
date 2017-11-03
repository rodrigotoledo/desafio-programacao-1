Rails.application.routes.draw do
  get 'home/index'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#index"

  post 'import', to: 'home#import'
  match 'import_purchase_with_success/:id', to: 'import_purchases#import_purchase_with_success'
  match 'import_purchase_with_error/:id', to: 'import_purchases#import_purchase_with_error'
end
