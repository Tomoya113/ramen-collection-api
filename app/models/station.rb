class Station < ApplicationRecord
  has_many :shops, through: :shop_stations
  has_many :shop_stations

  has_many :users, through: :station_users
  has_many :station_users
end
