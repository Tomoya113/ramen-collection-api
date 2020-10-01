class CreateShopUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :shop_users do |t|
      t.string :shop_id
      t.string :user_id

      t.timestamps
    end
  end
end
