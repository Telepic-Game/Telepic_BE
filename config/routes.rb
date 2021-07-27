Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :register, only: [:create, :destroy], controller: "register"
      resources :login, only: [:create], controller: "login"
      delete "/test/database_all", to: "test#destroy_database"

      # Waiting Rooms
      post 'open_waiting_room', to: "waiting_room#create"
     end
  end
end
