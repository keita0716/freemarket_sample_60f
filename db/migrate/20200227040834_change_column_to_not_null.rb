class ChangeColumnToNotNull < ActiveRecord::Migration[5.2]
  def up
    change_column :images, :src,:string, null: false
  end

  def down
    change_column :images, :src,:string
  end
end
