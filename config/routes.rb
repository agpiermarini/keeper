Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root controller: :welcome, action: :index

  get '/auth/twitter', as: :twitter_login
  get '/auth/twitter/callback', to: 'sessions#create'

  get '/logout', to: "sessions#destroy"

  get '/dashboard', to: "dashboard#show"
end
