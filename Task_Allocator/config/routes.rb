TaskAllocator::Application.routes.draw do
  devise_for :users
  #root to splash page
  root :to => 'splash#index'
  #dashboard roots
  get '/dashboard', :to => 'dashboard#index'
  post '/users/update', :to => 'user#update'

  #group roots
  get '/groups/:id', :to => 'groups#index'
  resources :groups, only: [:create, :edit, :update, :destroy]
  post '/groups/:id', :to => 'groups#update'
  post '/groups/add_member', :to => 'groups#add_member'

  #task roots
  get '/tasks/:id', :to => 'tasks#index'
  resources :tasks, only: [:create, :edit, :update, :destroy]
  post '/tasks/:id', :to => 'tasks#update'

end
