# frozen_string_literal: true

require 'faker'

Item.destroy_all
User.destroy_all
Cart.destroy_all
Order.destroy_all
@img = [
  "https://i.goopics.net/Dvpx2.jpg",
  "https://i.goopics.net/qZWDa.jpg",
  "https://i.goopics.net/gJZDm.jpg",
  "https://i.goopics.net/krpZJ.jpg",
  "https://i.goopics.net/VQPJd.jpg",
  "https://i.goopics.net/aQLdp.jpg",
  "https://i.goopics.net/3WxDq.jpg",
  "https://i.goopics.net/nWmJm.jpg",
  "https://i.goopics.net/94pEV.jpg",
  "https://i.goopics.net/GWVXn.jpg",
  "https://i.goopics.net/XQ9Vg.jpg",
  "https://i.goopics.net/wQdq4.jpg",
  "https://i.goopics.net/dX54a.jpg",
  "https://i.goopics.net/NKdoZ.jpg",
  "https://i.goopics.net/krpZo.jpg",
  "https://i.goopics.net/VQPJv.jpg",
  "https://i.goopics.net/aQLdR.jpg",
  "https://i.goopics.net/3WxDm.jpg",
  "https://i.goopics.net/nWmJb.jpg",
  "https://i.goopics.net/94pEj.jpg"
]

# create 20 items with Faker
20.times do |_index|
  Item.create(
    title: Faker::HarryPotter.character,
    description: Faker::HarryPotter.quote,
    price: Faker::Number.decimal(2),
    image_url: @img.sample
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
  order = Order.create(
    user_id: User.all.sample.id,
  )
  order.items.push(Item.all.sample(5))
end

# create Tibo user
tibo = User.create(
  username: "tibo",
  email: "tibo@lol.com",
  password: "qwerty",
  admin: true
)

# create some orders for Tibo
2.times do |_index|
  order = Order.create(
    user_id: tibo.id,
  )
  order.items.push(Item.all.sample(5))
end
