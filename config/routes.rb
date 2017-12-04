Rails.application.routes.draw do



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "user#index"

  devise_for :users, controllers: {
      sessions: 'users/sessions',
      passwords: 'users/passwords',
      registrations: 'users/registrations'
      #,
      # confirmations: 'users/confirmations',
      # omniauth_callbacks: 'users/omniauth_callbacks'

  }

  devise_scope :user do
    get "users/sign_out", :to => "users/sessions#destroy", via: [:delete]
    post "sessions/user", :to => "users/sessions#create", via: [:post]
  end

  get "account", to: "user#show"

  resources :sessions
  resources :user do
    resources :devices
  end

  #API
  mount API::Base, at:"/"

  #mount_devise_token_auth_for :user, at: 'api/v1/users/auth'

  #get "user/:id", :to => "users#show", as: "profile"
  #get "user/:id", :to => "user#show", as: "my_profile"

end
