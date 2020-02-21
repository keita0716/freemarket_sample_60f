class CreateImages < ActiveRecord::Migration[5.2]
  def change
    create_table :images do |t|
      t.string :src
      t.string :image 
      t.integer :item_id, foreign_key: true
      t.references     :item,foreign_key:true
      t.timestamps
    end
  end
end
