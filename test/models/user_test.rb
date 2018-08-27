require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    User.destroy_all
    @user = User.new(
      username: 'tata',
      email: 'tata@lol.com',
      password: 'qwerty',
      password_confirmation: 'qwerty'
    )
  end

  test "can create a valid user" do
    assert_not @user.errors.any?
    # assert users(:one)
  end
end
