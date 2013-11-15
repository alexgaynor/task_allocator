TaskAllocator::Application.routes.draw do

  devise_for :users, :controllers => { registrations: 'registrations' }
  devise_scope :user do 
  	post "/users/edit" => "user#update"
  end

  #dashboard roots
  get '/dashboard', :to => 'dashboard#index'

  #group roots
  get '/groups/:id', :to => 'groups#index'
  resources :groups, only: [:create, :edit, :update, :destroy]
  post '/groups/add_member', :to => 'groups#add_member'
  post '/groups/:id', :to => 'groups#update'
  get '/invite', :to => 'groups#invite'

  #task roots
  get '/tasks/:id', :to => 'tasks#index'
  resources :tasks, only: [:create, :edit, :update, :destroy]
  post '/tasks/:id', :to => 'tasks#update'

  #root to splash page
  root :to => 'splash#index'

end
