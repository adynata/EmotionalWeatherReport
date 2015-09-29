Rails.application.routes.draw do

  devise_scope :user do
    get '/auth/:provider/callback', to: 'devise/sessions#create'
    get '/login', :to => 'devise/sessions#new', :as => :login
    get '/auth/failure', :to => 'devise/sessions#failure'
    get '/logout', :to => 'devise/sessions#destroy'
  end
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"

  root 'application#index'
  # get "/*path" => "application#index"
  # root 'forecasts#index'
  get '/feels/new', :to => 'feels#new'
  get '/feels/log', :to => 'feels#log'

  resources 'forecasts'
  resources 'feels'
  devise_for :users, :controllers => { omniauth_callbacks: 'omniauth_callbacks' }
  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'
  match '/users/:id/finish_signup' => 'users#finish_signup', via: [:get, :patch], :as => :finish_signup


end
