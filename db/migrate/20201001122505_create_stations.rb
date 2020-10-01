class CreateStations < ActiveRecord::Migration[5.2]
  def change
    create_table :stations, id: false do |t|
      t.string :station_id, null: false, primary_key: true
      t.string :name

      t.timestamps
    end
  end
end
