class Item < ApplicationRecord
  has_and_belongs_to_many :carts
  has_and_belongs_to_many :orders
  belongs_to :category

  validates :title, presence: true, uniqueness:true
  validates :description, presence:true
  validates :price, presence:true
  validates :image_url, presence:true, uniqueness:true

end
