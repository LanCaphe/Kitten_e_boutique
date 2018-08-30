Rails.application.routes.draw do
#
  namespace :admin do
      resources :users
      resources :carts
      resources :items
      resources :orders

      root to: "orders#index"
    end

  get '/carts/show', to: 'carts#show', as: 'show_cart'
  post '/carts/show', to: 'carts#valid', as: 'valid_cart'
  get 'carts/add/:id', to: 'carts#add_item', as: 'add_item'
  get 'carts/delete/:id', to: 'carts#delete_item', as: 'delete_item'
  get 'user/profil', to: 'user#profil'
  root 'items#index'
  get 'items/show/:id', to: 'items#show'
  get '/:category', to: 'items#index', as: 'index_category'
#  devise_for :users
  # post '/login', to: 'session/sessions#create'

#Mode simple

    # devise_for :users, :path => '', :path_names => { :sign_in => "login", :sign_out => "logout", :sign_up => "register" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  devise_for :users, controllers: {
        sessions: 'session/sessions'
      }
end
