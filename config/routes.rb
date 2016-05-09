Rails.application.routes.draw do

  root to: 'cities#index'

  get '/cities/about', to: 'cities#about', as: 'about'

# User routes

  get '/users/new', to: 'users#new', as: 'new_user'
  post '/users', to: 'users#create'
  get '/users/:id', to: 'users#show', as: 'user'
  get '/users/:id/edit', to: 'users#edit', as: 'edit_user'
  patch '/users/:id', to: 'users#update'

# Route to deactivate account
  get '/users/:id/changestatus', to: 'users#toggle', as: 'toggle_active_user'

# Sessions routes for login, signup, and logout
  get '/login', to: 'sessions#new'
  get '/logout', to: 'sessions#destroy'
  post '/sessions', to: 'sessions#create'

  resources :cities do
    resources :posts, except: :index
  end

  get '*path', to: 'cities#index'

end
