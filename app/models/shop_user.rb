class ShopUser < ApplicationRecord
  belongs_to :user
  belongs_to :shop, primary_key: :shop_id
end
