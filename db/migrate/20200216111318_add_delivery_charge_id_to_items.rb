class AddDeliveryChargeIdToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :delivery_charge_id, :integer
  end
end
