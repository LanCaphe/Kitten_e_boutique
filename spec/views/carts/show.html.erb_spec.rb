# frozen_string_literal: true

require 'rails_helper'

RSpec.describe "carts/show.html.erb", type: :view do
  describe "with a logged in user" do
    fixtures :users
    it "shows the proper items" do
      user = users(:one)
      item = Item.create(
        title: "lol",
        description: "haha",
        price: 2
      )
      user.items.push(item)
    end
  end
end
