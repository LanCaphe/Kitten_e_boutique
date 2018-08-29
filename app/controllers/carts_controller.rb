class CartsController < ApplicationController
  def show
    if user_signed_in?
      if current_user.cart
        @cart = current_user.cart.items 
      else
        @cart = []
      end
    else
      @cart = session[:cart]
    end
  end

  def add_item
    if user_signed_in?
      if !current_user.cart
        cart = Cart.create(user_id: current_user.id)
      else
        cart = current_user.cart
      end
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
    # flash[:success] = "Item successfully added to your cart."
    # lets make an ajax print inthe header
  end

  def delete_item
    if user_signed_in?
      cart = current_user.cart
      cart.items.destroy(params[:id])
      cart.save
    else
      # doesnt work yet
      p "HERE"
      session[:cart].delete(Item.find(params[:id]))
      session.save
      p "DELETED?"
      p session[:cart]
      p session[:cart].find(Item.find(params[:id]))
      p "THERE"
    end
  end
end
