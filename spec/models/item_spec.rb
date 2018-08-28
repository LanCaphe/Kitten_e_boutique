require 'rails_helper'

RSpec.describe Item, type: :model do
 item=Item.new
    it "is not valid without a title" do
      expect(item).to_not be_valid
      end

    it "is not valid without a description" do
      item.title = "bob"
      expect(item).to_not be_valid
    end

    it "is not valid without a price" do
      item.title = "Bob"
      item.description = "Lorem ipsum dolor sit amet"
      expect(item).to_not be_valid
    end

    it "is not valid without a image_url" do
      item.title = "Bob"
      item.description = "Lorem ipsum dolor sit amet"
      item.price = 10.26
      expect(item).to_not be_valid
    end
end
