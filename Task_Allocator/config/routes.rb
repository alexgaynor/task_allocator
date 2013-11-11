TaskAllocator::Application.routes.draw do
  devise_for :users, :controllers => { :registrations => "registrations", sessions: "sessions" }

  root 'users#index'

end
