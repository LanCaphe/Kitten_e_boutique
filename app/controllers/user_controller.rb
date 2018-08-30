class UserController < ApplicationController
  def profil
    @orders = current_user.orders
    @user = current_user.id
  end
end
