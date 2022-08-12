Rails.application.routes.draw do
  devise_for :admins

  namespace :api do
    namespace :v1 do
      resources :users
      resources :blogs
      post '/auth/login', to: 'authentication#login'
    end
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
