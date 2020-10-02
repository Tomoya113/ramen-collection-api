class ShopStation < ApplicationRecord
  belongs_to :station
  belongs_to :shop, primary_key: :shop_id

  validates :station_id, uniqueness: { scope: :shop_id }
end
