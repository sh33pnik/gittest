Rails.application.routes.draw do
  get "userPost", to: "microposts#user_Post"

  resources :microposts
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
