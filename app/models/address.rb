class Address < ApplicationRecord
  belongs_to :user, optional: true
  validates :address_family_name,:address_first_name,:address_family_kana_name,:address_first_kana_name,:zipcode,:prefecture,:city,:block,presence: true
  #validates :zipcode, format: { with: /\A\d{3}[-]\d{4}$|^\d{3}[-]\d{2}$|^\d{3}\z/ }
end
