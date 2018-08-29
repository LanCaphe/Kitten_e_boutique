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
      session[:cart].push(Item.find(params[:id]))
    end
  end

  def create
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
    redirect_to new_charge_path
  end
end
