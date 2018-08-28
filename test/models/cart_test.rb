require 'test_helper'

class CartTest < ActiveSupport::TestCase

  def setup
    User.destroy_all
    @user = User.new(
      username: 'tata',
      email: 'tata@lol.com',
      password: 'qwerty',
      password_confirmation: 'qwerty'
    )
    @user.save
  end

  test "should know if cart is valid" do
    cart = Cart.new(user_id: User.all.sample.id)
    assert cart.valid?
  end
end
