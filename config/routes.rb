Rails.application.routes.draw do

  namespace :api, defaults: { format: :json } do
    get 'login', :to => "sessions#login"
    get 'callback', :to => "sessions#callback"
    get 'logout', :to => "sessions#logout"
    get 'search', :to => "github_queries#query"
    # get 'search', :to => "github_queries#index"
    get 'repositories', :to => "github_queries#repositories"
  end
    get '/', :to => "home#index", as: "home"
    get '/users/:id', :to => "users#show"
    get '/collections/:id', :to => "collections#show", as: "collection"
    post 'collections', :to => "collections#create"
    post 'codeSnippets', :to => "code_snippets#create"
    delete '/collections/:id', :to => "collections#delete"

    resources :code_snippets, only: [:destroy]
end
