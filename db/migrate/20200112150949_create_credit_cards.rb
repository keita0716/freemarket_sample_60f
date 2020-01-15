class CreateCreditCards < ActiveRecord::Migration[5.2]
  def change
    create_table :credit_cards do |t|
      t.integer :card_number,               null: false
      t.integer :card_limit_month,          null: false
      t.integer :card_limit_year,           null: false
      t.integer :security_number,           null: false
      t.references :user, null: false, index: true, foreign_key: true
      t.timestamps
    end
  end
end
