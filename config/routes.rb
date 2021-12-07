Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do

      post 'login', to: 'sessions#login', as: "login"
      post 'refresh_token', to: 'sessions#refresh_token', as: "refresh_token"
      delete 'logout', to: 'sessions#logout', as: "logout"

      post 'forgot', to: 'passwords#forgot', as: "forgot_password"
      post 'reset_password', to: 'passwords#reset', as: "reset_password"

      resources :users
      resources :roles
      resources :plans
    end
  end
end
