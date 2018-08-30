module CartsHelper
  def cart_content
    if user_signed_in?
      if current_user.cart
        @cart = current_user.cart.items
      else
        @cart = []
      end
    else
      @cart = session[:cart] || []
    end
    @cart
  end
end
