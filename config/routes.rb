Rails.application.routes.draw do
 
  resources :ratings

  resources :boats

  #create a route for weather ajax. 
  resources :journeys do
    collection do
      get 'weather_at/:location', action: :weather_at
    end
    member do
      get 'weather_at/:location', action: :weather_at
    end
  end

  resources :bookings

  devise_for :users
  root to: "journeys#index"
 
  get "/profile/:id", to: "users#show", as: :profile

  get "/edit_my_profile", to: "users#edit", as: :edit_my_profile

  post "/bookings/:id/approved", to: "bookings#approve_booking", as: :booking_approve

end
