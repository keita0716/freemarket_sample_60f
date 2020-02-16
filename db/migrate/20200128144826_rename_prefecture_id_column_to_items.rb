class RenamePrefectureIdColumnToItems < ActiveRecord::Migration[5.2]
  def change
    rename_column :items, :shipping_prefecture_id, :shipping_prefecture_id
  end
end
