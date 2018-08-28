require 'faker'

#create 20 items with Faker
20.times do |index|
  Item.create(title:Faker::HarryPotter.character, description: Faker::HarryPotter.quote,
   price:Faker::Number.decimal(2), image_url: Faker::Avatar.image)
end
