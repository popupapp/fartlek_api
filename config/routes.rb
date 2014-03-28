FartlekApi::Application.routes.draw do
  
  root 'profiles#index'

  resources :laps
  resources :profiles

  get 'profiles/:intensity/:duration' => 'profiles#get_profile'
  get 'profiles/all/:intensity/:duration' => 'profiles#get_profiles'

end
