Rails.application.routes.draw do


  ActiveAdmin.routes(self)

  devise_for :users
  as :user do
    get "signin", to: 'devise/sessions#new'
    delete "signout", to: 'devise/sessions#destroy'
    get 'signup', to: 'devise/registrations#new'
  end

  get 'feed', to: 'feed#show'

  resources :users, only: :show, param: :username do 
    member do 
      post 'follow', to: 'follows#create'
      delete 'unfollow', to: 'follows#destroy'
    end
  end

  resources :items do
    member do
      post 'vote', to: 'votes#create'
      delete 'unvote', to: 'votes#destroy'
    end
  end

  resources :tweets
  root 'pages#home'
  get 'users/:username', to: 'users#show'  
  get 'about', to: 'pages#about'
  get 'contactus', to:  'contact_us/contacts#new'
  get 'product_reviews', to: 'pages#product_reviews'
  get 'new_product_delivery', to: 'pages#new_product_delivery'
  get 'best_fit_product_delivery', to: 'pages#best_fit_product_delivery'
  get 'tweets', to: 'tweets#index'
  get 'items', to: 'items#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
