# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'

  resources :product_search, only: %i[show] do
    get :search, on: :collection
  end
  resources :product_details, only: %i[show]
  resources :family_details, only: %i[show]
  resources :dashboard, only: %i[index]
  namespace :dashboard do
    resources :groups, except: %i[show destroy]
    resources :families, except: %i[show destroy]
    resources :tax_classifications, except: %i[show destroy]
    resources :products, except: %i[show]
    resources :users, except: %i[show]
    resources :lines, except: %i[show destroy]
  end
end
