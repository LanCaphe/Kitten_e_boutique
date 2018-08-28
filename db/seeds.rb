require 'faker'
#create 20 items
20.times do |index|
  item = Item.create!(title: Faker::HarryPotter.spell, description: Faker::HarryPotter.quote,
  price: Faker::Number.decimal(2), image_url: Faker::Fillmurray.image)
end
