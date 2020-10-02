class AddColumnStations < ActiveRecord::Migration[5.2]
  def change
    add_column :stations, :latitude, :string, null: false
    add_column :stations, :longitude, :string, null: false
  end
end
