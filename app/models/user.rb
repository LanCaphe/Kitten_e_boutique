class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :username, presence: true, length: {minimum: 3, maximum: 10}

  has_one :cart
  has_many :orders
  has_many :items, :through => :cart
end
