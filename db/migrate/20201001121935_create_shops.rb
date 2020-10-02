class CreateShops < ActiveRecord::Migration[5.2]
  def change
    create_table :shops, id: false do |t|
      t.string :shop_id, null: false, primary_key: true
      t.string :name, null: false
      t.string :category, null: false
      t.string :latitude
      t.string :longitude
      t.string :image_url
      t.string :address

      t.timestamps
    end
  end
end
