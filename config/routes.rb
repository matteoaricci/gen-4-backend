Rails.application.routes.draw do
 resources :pokemons
 resources :users
 resources :teams
 resources :team_members
 
  get '/login', to: "auth#login"
  post '/register', to: "auth#create"
  get '/logout', to: "auth#logout"
  post '/new_team', to: "teams#create"
 
end
