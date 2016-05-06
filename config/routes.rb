Rails.application.routes.draw do


  root to: 'cities#index'

#User routes

  get '/users', to: 'users#index', as: 'users'
  get '/users/new', to: 'users#new', as: 'new_user'
  post '/users', to: 'users#create'
  get '/users/:id', to: 'users#show', as: 'user'
  get '/users/:id/edit', to: 'users#edit', as: 'edit_user'
  patch '/users/:id', to: 'users#update'


# Sessions routes for login, signup, and logout

  get '/login', to: 'sessions#new'
  get '/logout', to: 'sessions#destroy'
  post '/sessions', to: 'sessions#create'

# # Post routes
#
  get '/users/:user_id/posts', to: 'posts#index', as: 'user_posts'
  get '/users/:user_id/posts/new', to: 'posts#new', as: 'new_user_post'
  get '/users/:user_id/posts/:id', to: 'posts#show', as: 'user_post'

# Cities route
  get '/cities/', to: 'cities#index', as: 'cities'
  get '/cities/new', to: 'cities#new', as: 'new_city'
  post '/cities/', to: 'cities#create'
  get '/cities/edit', to: 'cities#edit', as: 'edit_city'
  patch '/cities/:id', to: 'cities#update'

# Cities_posts routes

  get "/cities/:city_id/posts", to: 'posts#index', as: 'city_posts'

  resources :cities do
    resources :posts
  end

end
