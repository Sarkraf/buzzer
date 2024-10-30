Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.

  # Defines the root path route ("/")
  # root "posts#index"
  #
  root to: "parties#index"

  get "parties/:name/choice", to: "parties#choice", as: :party_choice

  get "parties/:name/:url", to: "parties#manager", as: :party_manager

  resources :parties, param: :name do
    resources :groups, param: :name, only: %i[show create]
  end
end
