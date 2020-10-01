class User < ApplicationRecord
  has_many :shops, through: :shop_users
  has_many :shop_users
end
