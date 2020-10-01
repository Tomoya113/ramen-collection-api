class CreateShops < ActiveRecord::Migration[5.2]
  def change
    create_table :shops do |t|
      t.string :shop_id
      t.string :name
      t.string :category
      t.string :latitude
      t.string :longitude
      t.string :image_url
      t.string :address

      t.timestamps
    end
  end
end
