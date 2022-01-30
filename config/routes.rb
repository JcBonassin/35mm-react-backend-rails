Rails.application.routes.draw do
  resources :likes
  resource :users      
  resources :photos
  resources :comments, only: [:create, :destroy]
  get "/profile", to: "users#auto_login"  
  patch "/users/:id", to: 'users#update'
  post "/login", to: "users#login"
  get "/auto_login", to: "users#auto_login"
  post '/sign_up', to: 'users#create'
  root "home#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
