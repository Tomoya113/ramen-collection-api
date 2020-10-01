class Station < ApplicationRecord
  self.primary_key = :station_id
  has_many :shops, through: :shop_stations
  has_many :shop_stations
end
