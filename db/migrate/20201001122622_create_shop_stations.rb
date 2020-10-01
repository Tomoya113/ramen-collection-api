class CreateShopStations < ActiveRecord::Migration[5.2]
  def change
    create_table :shop_stations do |t|
      t.string :station_id
      t.string :shop_id

      t.timestamps
    end
  end
end
