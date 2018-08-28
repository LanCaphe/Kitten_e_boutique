class UserController < ApplicationController
  def profil
    @orders = current_user.orders
  end
end
