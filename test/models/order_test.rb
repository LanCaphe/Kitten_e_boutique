require 'test_helper'

class Ordertest < ActiveSupport::TestCase
  test "should know if order is valid" do
    order = Order.new
    assert order.valid?
  end
end
