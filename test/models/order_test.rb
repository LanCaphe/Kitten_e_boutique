require 'test_helper'

class Ordertest < ActiveSupport::TestCase
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

    test "should know if order is valid" do
      order = Order.new(user_id: User.all.sample.id)
      assert order.valid?
    end
end
