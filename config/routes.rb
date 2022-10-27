Rails.application.routes.draw do
  get "home/index"
  root "home#index"
  post "home/submit"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
