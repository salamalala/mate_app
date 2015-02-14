Rails.application.routes.draw do
 
  resources :ratings

  resources :boats

  resources :journeys

  resources :bookings

  devise_for :users
  root to: "journeys#index"
 
  get "/profile", to: "users#show", as: :profile

  get "/edit_my_profile", to: "users#edit", as: :edit_my_profile

  post "/bookings/:id/approved", to: "bookings#approve_booking", as: :booking_approve

end
