class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name
      t.string :description
      t.string :condition
      t.integer :size
      t.integer :delivery_charge
      t.date :shipping_date
      t.string :shipping_method
      t.integer :shipping_prefecture_id
      t.integer :price
      t.string :trade_status
      t.integer :user_id
      t.integer :brand_id
      t.integer :category_id
      t.integer :item_image_id

      t.timestamps
    end
  end
end
