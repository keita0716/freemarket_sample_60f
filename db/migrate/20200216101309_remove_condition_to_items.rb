class RemoveConditionToItems < ActiveRecord::Migration[5.2]
  def change
    remove_column :items, :condition, :string
  end
end

