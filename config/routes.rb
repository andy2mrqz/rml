Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "tweets#index"

  get "/tweets", to: "tweets#index"
  get "/tweets/:handle", to: "tweets#show"
end
