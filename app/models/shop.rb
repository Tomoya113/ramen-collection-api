class Shop < ApplicationRecord
  self.primary_key = :shop_id
  has_many :shop_stations
  has_many :stations, through: :shop_stations
  
  has_many :shop_users
  has_many :users, through: :shop_users

  validates :shop_id, uniqueness: true
  validates :latitude, uniqueness: { scope: :longitude }
end
