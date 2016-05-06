Rails.application.routes.draw do

  root to: 'cities#index'

# User routes
  get '/users', to: 'users#index', as: 'users'
  get '/users/new', to: 'users#new', as: 'new_user'
  post '/users', to: 'users#create'
  get '/users/:id', to: 'users#show', as: 'user'
  get '/users/:id/edit', to: 'users#edit', as: 'edit_user'
  patch '/users/:id', to: 'users#update'
  #Route to deactivate account
  get '/users/:id/changestatus', to: 'users#toggle', as: 'toggle_active_user'

# Sessions routes for login, signup, and logout
  get '/login', to: 'sessions#new'
  get '/logout', to: 'sessions#destroy'
  post '/sessions', to: 'sessions#create'

# Cities routes
  get '/cities/', to: 'cities#index', as: 'cities'
  get '/cities/:id', to: 'cities#show', as: 'city' # Needs controller action
  get '/cities/new', to: 'cities#new', as: 'new_city'
  post '/cities/', to: 'cities#create'
  get '/cities/edit', to: 'cities#edit', as: 'edit_city'
  patch '/cities/:id', to: 'cities#update'
  delete '/cities/:id', to: 'cities#destroy'


# Posts routes
get '/cities/:city_id/posts/:id', to: 'posts#show', as: 'post' # Needs controller action
get '/cities/:city_id/posts/new', to: 'posts#new', as: 'new_post' # Needs controller action
post '/cities/:city_id/posts', to: 'posts#create' # Needs controller action
get '/cities/:city_id/posts/:id/edit', to: 'posts#edit', as: 'edit_post' # Needs controller action
patch '/cities/:city_id/posts/:id', to: 'posts#update' # Needs controller action
delete '/cities/:city_id/posts/:id', to: 'posts#destroy' # Needs controller action

end
