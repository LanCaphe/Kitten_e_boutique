class CartsController < ApplicationController
  def show
    if user_signed_in?
      @cart = current_user.cart
    else
      @cart = session[:cart]
    end
  end

  def add_item
    if user_signed_in?
      cart = current_user.cart
      cart.items.push(Item.find(params[:id]))
      cart.save
    else
      session[:cart].push(Item.find(params[:id]))
    end
  end
end
