# frozen_string_literal: true

require 'faker'

Item.destroy_all
User.destroy_all
Cart.destroy_all
Order.destroy_all
@img = [
  "https://image.noelshack.com/fichiers/2018/35/4/1535632303-kitten-1.jpg",
  "https://image.noelshack.com/fichiers/2018/35/4/1535632303-kitten-2.jpg",
  "https://image.noelshack.com/fichiers/2018/35/4/1535632303-kitten-3.jpg",
  "https://image.noelshack.com/fichiers/2018/35/4/1535632303-kitten-4.jpg",
  "https://image.noelshack.com/fichiers/2018/35/4/1535632303-kitten-5.jpg",
  "https://image.noelshack.com/fichiers/2018/35/4/1535632303-kitten-6.jpg",
  "https://image.noelshack.com/fichiers/2018/35/4/1535632303-kitten-7.jpg",
  "https://image.noelshack.com/fichiers/2018/35/4/1535632303-kitten-8.jpg",
  "https://image.noelshack.com/fichiers/2018/35/4/1535632303-kitten-9.jpeg",
  "https://image.noelshack.com/fichiers/2018/35/4/1535634400-kitten-10.jpg",
  "https://image.noelshack.com/fichiers/2018/35/4/1535632303-kitten-11.jpg",
  "https://image.noelshack.com/fichiers/2018/35/4/1535632303-kitten-12.jpeg",
  "https://image.noelshack.com/fichiers/2018/35/4/1535634435-kitten-13.jpg",
  "https://image.noelshack.com/fichiers/2018/35/4/1535634535-kitten-14.jpg",
  "https://image.noelshack.com/fichiers/2018/35/4/1535632304-kitten-15.jpg",
  "https://image.noelshack.com/fichiers/2018/35/4/1535632937-kitten-16.jpeg",
  "https://image.noelshack.com/fichiers/2018/35/4/1535632937-kitten-17.jpg",
  "https://image.noelshack.com/fichiers/2018/35/4/1535632937-kitten-18.jpeg",
  "https://image.noelshack.com/fichiers/2018/35/4/1535632937-kitten-19.jpg",
  "https://image.noelshack.com/fichiers/2018/35/4/1535632938-kitten-20.jpeg"
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
User.create(
  username: "tibo",
  email: "tibo@lol.com",
  password: "qwerty",
  admin: true
)
