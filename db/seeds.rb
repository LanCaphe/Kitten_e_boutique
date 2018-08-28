require 'faker'

#create 20 items with Faker
20.times do |index|
  Item.create(title:Faker::HarryPotter.character, description: Faker::HarryPotter.quote,
  price:Faker::Number.decimal(2), image_url: Faker::Avatar.image)
end
#create 10 users
10.times do |index|
  User.create(username:Faker::HarryPotter.spell, email:Faker::Internet.email,
  password: Faker::Internet.password)
end
#create 20 orders
20.times do |index|
  a = rand(1..20)
  b = rand(1..10)
  Order.create(user_id: b,item_id: a)
end
