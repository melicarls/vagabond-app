Rails.application.routes.draw do

  root to: 'cities#index'

# User routes

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

  resources :cities do
    resources :posts
  end

  get '*path', to: 'cities#index'

#   city_posts GET    /cities/:city_id/posts(.:format)          posts#index
#              POST   /cities/:city_id/posts(.:format)          posts#create
# new_city_post GET    /cities/:city_id/posts/new(.:format)      posts#new
# edit_city_post GET    /cities/:city_id/posts/:id/edit(.:format) posts#edit
#    city_post GET    /cities/:city_id/posts/:id(.:format)      posts#show
#              PATCH  /cities/:city_id/posts/:id(.:format)      posts#update
#              PUT    /cities/:city_id/posts/:id(.:format)      posts#update
#              DELETE /cities/:city_id/posts/:id(.:format)      posts#destroy
#       cities GET    /cities(.:format)                         cities#index
#              POST   /cities(.:format)                         cities#create
#     new_city GET    /cities/new(.:format)                     cities#new
#    edit_city GET    /cities/:id/edit(.:format)                cities#edit
#         city GET    /cities/:id(.:format)                     cities#show
#              PATCH  /cities/:id(.:format)                     cities#update
#              PUT    /cities/:id(.:format)                     cities#update
#              DELETE /cities/:id(.:format)                     cities#destroy


end
