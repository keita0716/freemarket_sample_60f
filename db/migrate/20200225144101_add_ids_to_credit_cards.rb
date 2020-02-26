class AddIdsToCreditCards < ActiveRecord::Migration[5.2]
  def change
    add_column :credit_cards, :customer_id, :integer
    add_column :credit_cards, :card_id, :integer
  end
end
