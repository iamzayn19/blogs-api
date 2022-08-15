Rails.application.routes.draw do

  #root 'api/v1/blogs#index'

  devise_for :admin , controllers: {
    sessions: "admin/sessions"
  }
  
  namespace :admin do
    resources :dashboard
  end 

  

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
