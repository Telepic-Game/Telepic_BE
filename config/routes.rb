Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :register, only: [:create, :destroy], controller: "register"
      resources :login, only: [:create], controller: "login"
      delete "/test/users_all", to: "test#destroy_users"
    end
  end
end
