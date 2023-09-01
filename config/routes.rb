Rails.application.routes.draw do

  resources :microposts
  resources :users do
    resources :microposts, only: [:index, :show, :edit, :update, :destroy, :new], controller: "user_microposts"
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
