Rails.application.routes.draw do

  namespace :api, defaults: { format: :json } do
    get 'login', :to => "sessions#login"
    get 'callback', :to => "sessions#callback"
    get 'logout', :to => "sessions#logout"
    get 'search', :to => "github_queries#index"
    get 'repositories', :to => "github_queries#repositories"
  end
    get '/', :to => "home#index", as: "home"
    get '/users/:id', :to => "users#show"
    post 'collections', :to => "collections#create"

end
