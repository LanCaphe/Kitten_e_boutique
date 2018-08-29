# frozen_string_literal: true

require 'faker'

Item.destroy_all
User.destroy_all
Cart.destroy_all
Order.destroy_all


# create 20 items with Faker
20.times do |_index|
  Item.create(
    title: Faker::HarryPotter.character,
    description: Faker::HarryPotter.quote,
    price: Faker::Number.decimal(2),
    image_url: Faker::Avatar.image
  )
end
# create 10 users
10.times do |_index|
  User.create(
    username: Faker::HarryPotter.spell,
    email: Faker::Internet.email,
    password: Faker::Internet.password
  )
end

# create 5 carts
5.times do |_index|
  cart = Cart.create(
    user_id: User.all.sample.id
  )
  cart.items.push(Item.all.sample(4))
end

# create 20 orders
20.times do |_index|
  Order.create(
    user_id: User.all.sample.id,
  )
end

# create Tibo user
User.create(
  username: "tibo",
  email: "tibo@lol.com",
  password: "qwerty"
)
