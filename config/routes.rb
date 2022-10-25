Rails.application.routes.draw do
  root 'pages#home'
  get '/home', to: 'pages#home'

  resources :products do
    member do
      patch :buy
    end
    resources :reviews, only: [:new, :create, :destroy]
  end
  resources :reviews, only: [:index] do
    member do
      patch :toggle_is_approved
    end
  end
  get 'products/:id/responded', to: 'products#responded', as: 'responded'
  resources :categories
  
  get 'signup', to: 'users#new'
  resources :users, except: [:new]
  get 'admin', to: 'users#admin'


  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  get 'password/reset', to: 'password_resets#new'
  post 'password/reset', to: 'password_resets#create'
  get 'password/reset/edit', to: 'password_resets#edit'
  patch 'password/reset/edit', to: 'password_resets#update'

  get '/auth/:provider/callback', to: 'sessions#omniauth'

  resources :conversations do
    resources :messages
  end
end
