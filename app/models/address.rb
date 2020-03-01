class Address < ApplicationRecord
  belongs_to :user, optional: true
  kanji = /\A[一-龥]+\z/
  kana = /\A([ァ-ン]|ー)+\z/
  validates :address_family_name,:address_first_name,:address_family_kana_name,:address_first_kana_name,:zipcode,:prefecture,:city,:block,presence: true
  validates :address_family_name, length: { maximum: 15 }, format: { with: kanji }
  validates :address_first_name, length: { maximum: 15 }, format: { with: kanji }
  validates :address_family_kana_name, length: { maximum: 15 }, format: { with: kana }
  validates :address_family_kana_name, length: { maximum: 15 }, format: { with: kana }
  validates :zipcode, format: { with: /\A\d{3}[-]\d{4}$|^\d{3}[-]\d{2}$|^\d{3}\z/ }
  validates :tel, length: { maximum: 11 }
end
