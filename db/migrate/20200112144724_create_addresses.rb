class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string  :address_family_name,       null: false
      t.string  :address_first_name,        null: false
      t.string  :address_family_kana_name,  null: false
      t.string  :address_first_kana_name,   null: false
      t.integer :zipcode,                   null: false
      t.string  :prefecture,                null: false
      t.string  :city,                      null: false
      t.string  :block,                     null: false
      t.string  :building,                  null: false
      t.integer :tel,                       null: false,unique: true
      t.references :user, null: false, index: true, foreign_key: true
      t.timestamps
    end
  end
end
