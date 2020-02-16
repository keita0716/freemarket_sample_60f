class RemoveShippingDateFromItems < ActiveRecord::Migration[5.2]
  def change
    remove_column :items, :shipping_date, :date
  end
end
