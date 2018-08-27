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
    @user.save
  end

  test "can create a valid user" do
    assert_not @user.errors.any?
  end

  test "invalid user can't be created" do
    @user.email = nil
    @user.save
    assert @user.errors.any?
  end

  test "username is required" do
    @user.username = nil
    @user.save
    assert @user.errors.any?
  end

  test "username must be at least 3char long" do
    @user.username = ''
    @user.save
    assert @user.errors.any?
  end

  test "username cant be longer than 10char" do
    @user.username = '123456789011'
    @user.save
    assert @user.errors.any?
  end
end
