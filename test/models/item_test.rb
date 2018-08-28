require 'test_helper'

class ItemTest < ActiveSupport::TestCase

  def setup
   @item = Item.new(title: "Bob", description: "the cat", price: 9.99,
     image_url: "url image" )
  end

  test "should be valid" do
    assert @item.valid?
  end

  test "title should be present" do
   @item.title = "     "
   assert_not @item.valid?
   end

   test "item should be unique" do
    duplicate_item = @item.dup
    @item.save
    assert_not duplicate_user.valid?
  end

  test "description should be present" do
  @item.description = "     "
  assert_not @item.valid?
  end

  test "image_url should be present" do
  @item.image_url = "     "
  assert_not @item.valid?
  end
end
