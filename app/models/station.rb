class Station < ApplicationRecord
  has_many :shop_stations
  has_many :shops, through: :shop_stations
  
  has_many :station_users
  has_many :users, through: :station_users

  validates :name, uniqueness: true
  validates :latitude, uniqueness: { scope: :longitude }
end
