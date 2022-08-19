Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  #root 'api/v1/blogs#index

  namespace :api do
    namespace :v1 do
      resources :users
      resources :blogs do
        resources :comments
        resources :blog_likes
      end 
      post '/session/new', to: 'session#create'
      post '/registration/new', to: 'registration#create'
    end
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
