class CreateShopStations < ActiveRecord::Migration[5.2]
  def change
    create_table :shop_stations do |t|
      t.references :station, type: :string, null: false
      t.references :shop, type: :string, null: false

      t.timestamps
    end
    add_foreign_key :shop_stations, :stations, column: :station_id, primary_key: :station_id
    add_foreign_key :shop_stations, :shops, column: :shop_id, primary_key: :shop_id
  end
end
