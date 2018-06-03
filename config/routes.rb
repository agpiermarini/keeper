Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root controller: :welcome, action: :index

  get '/auth/twitter', as: :twitter_login
  get '/auth/twitter/callback', to: 'sessions#create'

  get '/logout', to: 'sessions#destroy'

  get '/dashboard',       to: 'dashboard#show', as: :dashboard
  post '/saved-profiles', to: 'saved_profiles#create', as: :saved_profiles

  get '/search', to: 'search#show'

  get '/:username', to: 'profiles#show'

  get '/:username/personality-profile', to: 'personality_profile#show'
  post '/:username/personality-profile', to: 'personality_profile#create'
end
