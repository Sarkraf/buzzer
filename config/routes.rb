Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.

  # Defines the root path route ("/")
  # root "posts#index"
  #
  # Action Cable is a framework for real-time communication with WebSockets.
  # To enable Action Cable, you need to mount it in your application's routes.
  mount ActionCable.server => "/cable"

  root to: "parties#index"

  # get "parties/:name/fetch_data", to: "parties#fetch_data", as: :fetch_data

  # get "parties/:name/choice", to: "parties#choice", as: :party_choice

  # get "parties/:name/:url", to: "parties#manager", as: :party_manager

  resources :buzzs, only: %i[update]

  resources :parties, param: :name, only: %i[create show] do
    member do
      get :fetch_data
      get :choice
      get ":url", to: "parties#manager", as: :manager
      patch :next_round, to: "parties#next_round"
      patch :next_try, to: "parties#next_try"
      patch :update_score, to: "parties#update_score"
      patch :freddify, to: "parties#freddify"
    end
    resources :groups, param: :name, only: %i[show create]
  end
end
