Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
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
      resources :activities
      resources :redeems, only: [:create]
      resources :activity_plans, only: [:index, :show, :update]
    end
  end

  resources :welcome
  root "welcome#index"
end
