class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :shipping_prefecture
  belongs_to_active_hash :condition
  belongs_to_active_hash :delivery_charge
  belongs_to_active_hash :shipping_date
end
