Rails.application.routes.draw do



  root to: 'users#index'


#User routes

  get '/users', to: 'users#index', as: 'users'



  get '/users/new', to: 'users#new', as: 'new_user'





  post '/users', to: 'users#create'




  get '/users/:id', to: 'users#show', as: 'user'


# Sessions routes for login, signup, and logout

  get '/login', to: 'sessions#new', as: 'new_session'


  get '/logout', to: 'sessions#destroy'


  post '/sessions', to: 'sessions#create'



end
