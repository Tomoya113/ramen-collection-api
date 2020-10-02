class AddIsFinishedToStationUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :shop_users, :isFinished, :boolean, null: false, default: false
  end
end
