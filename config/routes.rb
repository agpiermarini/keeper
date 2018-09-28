Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root controller: :welcome, action: :index

  get '/auth/twitter', as: :twitter_login
  get '/auth/twitter/callback', to: 'sessions#create'

  get '/logout', to: 'sessions#destroy'

  get '/dashboard', to: 'dashboard#show', as: :dashboard

  get    '/saved-profiles/:id', to: 'saved_profiles#show',   as: :saved_profile
  post   '/saved-profiles',     to: 'saved_profiles#create', as: :saved_profiles
  delete '/saved-profiles/:id', to: 'saved_profiles#destroy'

  get '/search', to: 'search#show'

  get '/personality-profile-text/new', to: 'personality_profile_text#new', as: "new_personality_profile_text"
  post '/personality-profile-text', to: 'personality_profile_text#show'

  get '/:username', to: 'profiles#show'

  get '/:username/personality-profile',  to: 'personality_profile#show'
  post '/:username/personality-profile', to: 'personality_profile#create'
end
