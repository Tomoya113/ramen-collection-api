class CreateStationUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :station_users do |t|
      t.string :station_id
      t.string :user_id

      t.timestamps
    end
  end
end
