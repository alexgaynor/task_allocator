TaskAllocator::Application.routes.draw do
  devise_for :users

  root :to => 'splash#index'
  get '/dashboard', :to => 'dashboard#index'
  post '/users/update', :to => 'user#update'

end
