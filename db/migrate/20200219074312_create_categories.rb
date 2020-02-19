class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.integer :category_left_id
      t.string :category_left_name
      t.integer :category_center_id
      t.string :category_center_name
      t.integer :category_right_id
      t.string :category_right_name
      t.integer :item_id
      t.timestamps
    end
  end
end
