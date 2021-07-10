Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :register, only: [:create], controller: "register"
      resources :login, only: [:create], controller: "login"
    end
  end
end
