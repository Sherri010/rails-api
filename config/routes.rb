Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # namespace :api do
  #   resources :users
  # end

  resources :users

  post "/users/login" , to:"users#login", as: "login"
end
