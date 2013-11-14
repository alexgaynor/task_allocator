TaskAllocator::Application.routes.draw do
  get '/invite', :to => 'groups#invite'
  devise_for :users, :controllers => { registrations: 'registrations' }
  #root to splash page
  root :to => 'splash#index'
  #dashboard roots
  get '/dashboard', :to => 'dashboard#index'
  post '/users/update', :to => 'user#update'


  #group roots
  get '/groups/:id', :to => 'groups#index'
  resources :groups, only: [:create, :edit, :update, :destroy]
  post '/groups/add_member', :to => 'groups#add_member'

  #task roots
  get '/tasks/:id', :to => 'tasks#index'
  resources :tasks, only: [:create, :edit, :update, :destroy]

end
