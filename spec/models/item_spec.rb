require 'rails_helper'

RSpec.describe Item, type: :model do
  kitten{Items.new}
     it "is valid with valid attributes" do
         kitten.title = "Bob"
         kitten.description = "the cat"
         kitten.price= 10.99
         kitten.image_url = "image"
         expect(kitten).to be_valid
       end

    it "is not valid without a title" do
      expect(kitten).to_not be_valid
      end

    it "is not valid without a description" do
      kitten.title = "bob"
      expect(kitten).to_not be_valid
    end

    it "is not valid without a price" do
      kitten.title = "Bob"
      kitten.description = "Lorem ipsum dolor sit amet"
      expect(kitten).to_not be_valid
    end

    it "is not valid without a image_url" do
      kitten.title = "Bob"
      kitten.description = "Lorem ipsum dolor sit amet"
      kitten.price = 10.26
      expect(kitten).to_not be_valid
    end
end 
