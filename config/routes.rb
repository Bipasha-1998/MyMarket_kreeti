Rails.application.routes.draw do
  root 'pages#home'
  get '/home', to: 'pages#home'
  # Products and its reviews
  resources :products do
    member do
      patch :buy
    end
    resources :reviews, only: %i[new create destroy]
  end
  get 'products/:id/responded', to: 'products#responded', as: 'responded'
  resources :reviews, only: [:index] do
    member do
      patch :toggle_is_approved
    end
  end

  # Categories
  resources :categories

  # User signup and login
  get 'signup', to: 'users#new'
  resources :users, except: [:new]
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  # User admin
  get 'admin', to: 'users#admin'
  
  # Password Reset
  get 'password/reset', to: 'password_resets#new'
  post 'password/reset', to: 'password_resets#create'
  get 'password/reset/edit', to: 'password_resets#edit'
  patch 'password/reset/edit', to: 'password_resets#update'

  # Login with google
  get '/auth/:provider/callback', to: 'sessions#omniauth'

  # Conversations and Messages
  resources :conversations do
    resources :messages
  end
end
