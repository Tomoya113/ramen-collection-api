class CreateShopUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :shop_users do |t|
      t.references :user, null: false, foreign_key: true
      t.references :shop, type: :string, null: false
      t.timestamps
    end
    add_foreign_key :shop_users, :shops, column: :shop_id, primary_key: :shop_id
  end
end
