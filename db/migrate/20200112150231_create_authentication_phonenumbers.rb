class CreateAuthenticationPhonenumbers < ActiveRecord::Migration[5.2]
  def change
    create_table :authentication_phonenumbers do |t|
      t.integer :authentication_phonenumber,                       null: false
      t.references :user, null: false, index: true, foreign_key: true

      t.timestamps
    end
  end
end
