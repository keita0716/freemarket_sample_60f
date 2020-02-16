class AddShippingDateIdToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :shipping_date_id, :integer
  end
end
