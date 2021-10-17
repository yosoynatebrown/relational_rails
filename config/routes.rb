Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # get '/', to: 'welcome#index'
  get '/coaches', to: 'coaches#index'
  get '/coaches/new', to: 'coaches#new'
  get '/coaches/:id', to: 'coaches#show'
  get '/coaches/:id/players', to: 'coach_players#index'
  post '/coaches/', to: 'coaches#create'
  patch '/coaches/:id', to: 'coaches#update'
  get '/coaches/:id/edit', to: 'coaches#edit'
  get '/coaches/:id/players/new', to: 'coach_players#new'
  post '/coaches/:id/players', to: 'coach_players#create'
  delete '/coaches/:id', to: 'coaches#destroy'


  get '/cities', to: 'cities#index'
  get '/cities/new', to: 'cities#new'
  get '/cities/:id', to: 'cities#show'
  get '/cities/:id/teams', to: 'city_teams#index'
  post '/cities/', to: 'cities#create'
  patch '/cities/:id', to: 'cities#update'
  get '/cities/:id/edit', to: 'cities#edit'
  get '/cities/:id/teams/new', to: 'city_teams#new'
  post '/cities/:id/teams', to: 'city_teams#create'
  delete '/cities/:id', to: 'cities#destroy'

  get '/players', to: 'players#index'
  get '/players/new', to: 'players#new'
  get '/players/:id', to: 'players#show'
  post '/players/', to: 'players#create'
  delete '/players/:id', to: 'players#destroy'


  get '/teams', to: 'teams#index'
  get '/teams/new', to: 'teams#new'
  get '/teams/:id', to: 'teams#show'
  post '/teams/', to: 'teams#create'
  delete '/teams/:id', to: 'teams#destroy'
end
