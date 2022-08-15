Rails.application.routes.draw do
  devise_for :admin

  root 'api/v1/blogs#index'

  namespace :api do
    namespace :v1 do
      resources :users
      resources :blogs do
        resources :comments
        resources :blog_likes
      end 
      post '/auth/login', to: 'authentication#login'
    end
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
