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
  scope :saling_items, -> { where("seller_id is not NULL && buyer_id is NULL && auction_id is NULL") }
  #seller_idあり、buyer_idなし、 auction_idなしのitemはsaling_items（出品アイテムとなる）
  scope :trading_items, -> { where("seller_id is not NULL && buyer_id is not NULL && auction_id is NULL") }
  #seller_idあり、buyer_idあり、 auction_idなしのitemはtrading_items（取引中アイテムとなる）
  scope :soldout_items, -> { where("seller_id is not NULL && buyer_id is not NULL && auction_id is not NULL") }
  #seller_idあり、buyer_idあり、auction_idありのitemはsold_items（出品停止アイテムとなる）
end
