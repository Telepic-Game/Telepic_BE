Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :register, only: [:create, :destroy], controller: "register"
      resources :login, only: [:create], controller: "login"
      delete "/test/database_all", to: "test#destroy_database"

      # Waiting Rooms
      get 'waiting_room', to: "waiting_room#get"
      post 'open_waiting_room', to: "waiting_room#create"
      post 'non_host_join_waiting_room', to: "waiting_room#create_more_players"

      #Games
      patch 'start_game', to: "games#start"
     end
  end
end
