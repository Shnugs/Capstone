Rails.application.routes.draw do
  namespace :api do

    post "/users" => "#create"
    delete "/users/:id" => "#destroy"

    get "/characters" => "#index"
    post "/characters" => "#create"
    get "/characters/:id" => "#show"
    patch "/characters/:id" => "#update"
    delete "/characters/:id" => "#destroy"

    get "/simulations" => "#index"
    post "/simulations" => "#create"
    get "/simulations/:id" => "#show"
    delete "/simulations/:id" => "#destroy"

    get "/battle_clusters" => "#index"
    post "/battle_clusters" => "#create"
    get "/battle_clusters/:id" => "#show"
    delete "/battle_clusters/:id" => "#destroy"

    get "/battles" => "#index"
    post "/battles" => "#create"
    get "/battles/:id" => "#show"
    delete "/battles/:id" => "#destroy"
  end
end
