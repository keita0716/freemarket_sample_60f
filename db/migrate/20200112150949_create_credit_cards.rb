class CreateCreditCards < ActiveRecord::Migration[5.2]
  def change
    create_table :credit_cards do |t|
      t.integer :card_number
      t.integer :card_limit_month
      t.integer :card_limit_year
      t.integer :security_number
      t.references :user, null: false, index: true, foreign_key: true
      t.timestamps
    end
  end
end
