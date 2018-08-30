# frozen_string_literal: true

class Session::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  after_action :login_cart, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  def create
    super
  end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  protected

  def login_cart
    return if !session[:cart]
    if !current_user.cart
      current_user.cart = Cart.create(user_id: current_user.id)
      current_user.save
    end
    session[:cart].each do |item|
      current_user.cart.items.push(Item.find(item["id"]))
      current_user.save
    end
  end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
