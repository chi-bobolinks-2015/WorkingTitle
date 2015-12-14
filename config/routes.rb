Rails.application.routes.draw do

  namespace :api, defaults: { format: :json } do
    get 'login', :to => "sessions#login"
    get 'callback', :to => "sessions#callback"
    get 'logout', :to => "sessions#logout"
    get 'search', :to => "github_queries#index"
  end
    get '/', :to => "home#index", as: "home"
    get '/users/:id', :to => "users#show"
    post 'collections', :to => "collections#create"
    post 'codeSnippets', :to => "code_snippets#create"
end
