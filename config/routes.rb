Rails.application.routes.draw do


  get '/carts/show', to: 'carts#show', as: 'show_cart'
<<<<<<< HEAD
  post '/carts/show', to: 'carts#create', as: 'create_cart'
=======
  get 'carts/add/:id', to: 'carts#add_item', as: 'add_item'
  get 'carts/delete/:id', to: 'carts#delete_item', as: 'delete_item'
>>>>>>> e6fb1316fa59b52779ad1e7fb8668c2509e69bd3
  get 'user/profil', to: 'user#profil'
  root 'items#index'
  get 'items/show/:id', to: 'items#show'

#  devise_for :users

#Mode simple
    devise_for :users, :path => '', :path_names => { :sign_in => "login", :sign_out => "logout", :sign_up => "register" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
