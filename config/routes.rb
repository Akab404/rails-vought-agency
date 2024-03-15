Rails.application.routes.draw do
  devise_for :users
  root to: "superheros#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :superheros do
    resources :bookings, only: [:new, :create ]
    resources :reviews, only: [:new, :create]
  end

  patch "bookings/:id/accept", to: "bookings#accept", as: "accept"
  patch "bookings/:id/decline", to: "bookings#accept", as: "decline"


  get "/users/account", to: "pages#account"
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
