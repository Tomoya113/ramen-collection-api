class User < ApplicationRecord
  has_many :shops, through: :shop_users
  has_many :shop_users

  has_many :stations, through: :station_users
  has_many :station_users
end
