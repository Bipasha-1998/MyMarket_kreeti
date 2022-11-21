Rails.application.routes.draw do
  root 'pages#home'
  # Product Routes
  get 'admin_approved_products', to: 'products#admin_approved_products'
  get 'products/:id/responded', to: 'products#responded', as: 'responded' #Product owner to see the list of interested buyers
  get '/search_results', to: 'products#searched_products'
  resources :products do
    member do
      patch :buy    # Ajax to handle the buy now button feature
      patch :toggle_is_approved   # Admin to approve or reject the product ad created
    end
    # Reviews routes
    resources :reviews, only: %i[create destroy]
  end
  resources :reviews, only: [:index] do   # Index page for only admin to approve or reject reviews
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
