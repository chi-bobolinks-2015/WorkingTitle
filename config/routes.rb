Rails.application.routes.draw do

  namespace :api, defaults: { format: :json } do
    get 'login', :to => "sessions#login"
    get 'callback', :to => "sessions#callback"
  end
end
