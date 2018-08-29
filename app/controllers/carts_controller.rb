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
      if session[:cart]
        session[:cart].push(Item.find(params[:id]))
      else
        session[:cart] = []
        session[:cart].push(Item.find(params[:id]))
      end
    end
    flash[:success] = "Item successfully added to your cart."
  end

  def delete_item
    if user_signed_in?
      cart = current_user.cart
      cart.items.destroy(params[:id])
      cart.save
    else
      p "haha"
    end
  end
end
