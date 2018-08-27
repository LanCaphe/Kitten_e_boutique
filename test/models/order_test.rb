require 'test_helper'

class Ordertest < ActiveSupport::TestCase
  test "should be good" do
    a = Order.new
    assert a.valid?
  end
end
