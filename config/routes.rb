FartlekApi::Application.routes.draw do
  
  root 'profiles#index'

  resources :laps
  resources :profiles

  get 'profiles/:intensity/:duration' => 'profiles#get_profile'

end
