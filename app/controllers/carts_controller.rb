class CartsController < ApplicationController
  def show
    if user_signed_in?
      if current_user.cart
        @cart = current_user.cart.items
      else
        @cart = []
      end
    else
      @cart = session[:cart] || []
    end

    @sum_items = 0
    @cart.each do |item|
      @sum_items += item["price"].to_f
    end

    @show_cart = []
    @cart.each do |item|
      if @show_cart.select{|cart_item| cart_item[:id] == item["id"]}.count > 0
        @show_cart = @show_cart.map do |cart_item|
          if cart_item[:id] == item["id"]
            cart_item[:qty] += 1
          end
          cart_item
        end
      else
        @show_cart.push({
          id: item["id"],
          title: item["title"],
          price: item["price"],
          image_url: item["image_url"],
          qty: 1
        })
      end
      p @show_cart
    end
    @cart = @show_cart
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
    flash[:success] = "Item #{Item.find(params[:id]).title} successfully added to your cart."
    redirect_to root_path
    # lets make an ajax print inthe header
  end

  def delete_item
    if user_signed_in?
      cart = current_user.cart
      cart.items.delete(params[:id])
      cart.save
      # work but doesnt redirect?? should do it in js
    else
      # not the prettiest, carefull with types in select
      # also it removes all those with the same id
      # session[:cart] = session[:cart].select{|item| item["id"] != params[:id].to_i}
      session[:cart].select!{|item| item["id"] != params[:id].to_i}
    end
    flash[:success] = "Item removed from your cart"
    redirect_to show_cart_url
  end

  def valid
    # Amount in cents
    @amout = 500
    @cart = current_user.cart.items


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

    order = Order.create(
      user_id: current_user.id,
    )
    order.items.push(@cart)


    @cart.destroy_all


  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to valid_cart_path
  end
end
