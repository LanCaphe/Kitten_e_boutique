class CartsController < ApplicationController
  def show
    if user_signed_in?
      @cart = current_user.cart
    else
      @cart = session[:cart]
    end

    @somme_items = 0

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

  def valid
    # Amount in cents
    @amout = 500

    customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :source  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amout,
      :description => 'Rails Stripe customer',
      :currency    => 'usd'
    )

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to valid_cart_path
  end
end
