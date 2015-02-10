Rails.application.routes.draw do

  resources :ratings

  resources :boats

  resources :journeys

  resources :bookings

  devise_for :users
  root to: "journeys#index"
 
  get "/my_profile", to: "users#show", as: :my_profile
end
