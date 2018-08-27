class Item < ApplicationRecord
  has_many :carts

  validates :title, presence: true, uniqueness: true
  validates :description, presence:true
  validates :price, presence:true
  validates :image_url, presence:true

end
