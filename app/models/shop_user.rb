class ShopUser < ApplicationRecord
  belongs_to :user
  belongs_to :shop, primary_key: :shop_id

  validates :user_id, uniqueness: { scope: :shop_id }
end
