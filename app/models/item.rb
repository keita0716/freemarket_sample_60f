class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :shipping_prefecture
  belongs_to_active_hash :condition
  belongs_to_active_hash :delivery_charge
  belongs_to_active_hash :shipping_date
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true
  belongs_to :seller, class_name: "User", optional: true,foreign_key: "seller_id"
  belongs_to :buyer, class_name: "User", optional: true,foreign_key: "buyer_id"
  belongs_to :auction, class_name: "User", optional: true,foreign_key: "auction_id"
end
