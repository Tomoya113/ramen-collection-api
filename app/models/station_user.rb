class StationUser < ApplicationRecord
  belongs_to :station
  belongs_to :user

  validates :station_id, uniqueness: { scope: :user_id }
end
