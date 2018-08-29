class Item < ApplicationRecord
  has_and_belongs_to_many :carts
  has_and_belongs_to_many :orders

  validates :title, presence: true, uniqueness:true
  validates :description, presence:true
  validates :price, presence:true
  validates :image_url, presence:true

end
