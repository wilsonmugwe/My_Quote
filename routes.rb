Rails.application.routes.draw do
  # Search functionality
  get 'search/index'

  # Resources for quotes and categories
  resources :quotes_categories
  resources :categories do
    resources :quotes, only: [:index]  # Allows viewing quotes by category
  end

  resources :philosophers

  # Public access to quotes
  resources :quotes do
    collection do
      get 'search'      # Route for search_quotes_path
      get 'my_quotes'   # Route for my_quotes_path
      get 'manage'      # Route for managing quotes
    end
  end

  # User management routes
  get 'manage_users', to: 'users#manage'
  get 'manage_quotes', to: 'quotes#manage'

  # Resources for password resets
  resources :password_resets, only: [:new, :create, :edit, :update]

  resources :users do
    resources :quotes, only: [:index]
    member do
      get 'quotes', to: 'quotes#index', as: 'user_quotes' # Route to user's quotes
    end
  end

  resources :users do
    member do
      patch :toggle_admin
      patch :update_status
    end
  end
  

  # User profile
  get 'profile', to: 'users#profile'  # Keep this line for user profile access

  # Home and user-specific routes
  get 'home/index'
  get 'user_home', to: 'home#user_home'
  get 'my_quotes', to: 'home#my_quotes', as: 'my_quotes'

  # Static pages
  get 'about', to: 'home#about'

  # Authentication routes
  get 'sign_out', to: 'sessions#destroy'  # Change to a POST request if necessary
  get 'sign_up', to: 'users#new'
  get 'sign_in', to: 'sessions#new'
  post 'sign_in', to: 'sessions#create'

  # Admin dashboard and management paths
  namespace :admin do
    get 'dashboard', to: 'dashboard#index' # Admin dashboard path
    resources :users, only: [:index, :edit, :update, :destroy] # User management
    resources :quotes, only: [:index, :edit, :update, :destroy] # Quote management
  end

  # Defines the root path route ("/")
  root "home#index"
end
