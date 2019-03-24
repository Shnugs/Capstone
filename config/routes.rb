Rails.application.routes.draw do
  namespace :api do

    post "/users" => "users#create"
    delete "/users/:id" => "users#destroy"

    post "/sessions" => "sessions#create" 

    get "/characters" => "characters#index"
    get "/characters/user_characters" => "characters#user_characters"
    get "/characters/filter" => "characters#filter"
    post "/characters" => "characters#create"
    post "/characters/run_sim" => "characters#run_sim"
    get "/characters/:id" => "characters#show"
    patch "/characters/:id" => "characters#update"
    delete "/characters/:id" => "characters#destroy"

    get "/simulations" => "simulations#index"
    post "/simulations" => "simulations#create"
    get "/simulations/get/:id" => "simulations#get"
    get "/simulations/:id" => "simulations#show"
    delete "/simulations/:id" => "simulations#destroy"

    get "/battle_clusters" => "battle_clusters#index"
    post "/battle_clusters" => "battle_clusters#create"
    get "/battle_clusters/get/:id" => "battle_clusters#get"
    get "/battle_clusters/:id" => "battle_clusters#show"
    delete "/battle_clusters/:id" => "battle_clusters#destroy"

    get "/battles" => "battles#index"
    post "/battles" => "battles#create"
    get "/battles/:id" => "battles#show"
    delete "/battles/:id" => "battles#destroy"
  end
end
