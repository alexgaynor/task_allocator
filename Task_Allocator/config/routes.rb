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

  #task roots
  get '/tasks/:id', :to => 'tasks#index'
  resources :tasks, only: [:create, :edit, :update, :destroy]

end
