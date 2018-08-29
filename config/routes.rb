Rails.application.routes.draw do


  get '/carts/show', to: 'carts#show', as: 'show_cart'
  post '/carts/show', to: 'carts#create', as: 'create_cart'
  get 'user/profil', to: 'user#profil'
  root 'items#index'
  get 'items/show/:id', to: 'items#show'

#  devise_for :users

#Mode simple
    devise_for :users, :path => '', :path_names => { :sign_in => "login", :sign_out => "logout", :sign_up => "register" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
