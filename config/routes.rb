Rails.application.routes.draw do
  get '/auth/:provider/callback', to: 'sessions#create'
  get '/login', :to => 'sessions#new', :as => :login
  get '/auth/failure', :to => 'sessions#failure'
  get '/logout', :to => 'sessions#destroy'
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'forecasts#index'
  resources 'forecasts'
  resources 'feels'
  devise_for :users, :controllers => { omniauth_callbacks: 'omniauth_callbacks' }
  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'
  match '/users/:id/finish_signup' => 'users#finish_signup', via: [:get, :patch], :as => :finish_signup


end
