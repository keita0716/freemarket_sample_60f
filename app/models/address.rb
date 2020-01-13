class Address < ApplicationRecord
  belongs_to :user, optional: true
  validates :address_family_name,:address_first_name,:address_family_kana_name,:address_first_kana_name,:zipcode,:prefecture,:city,:block,:building,:tel,presence: true
end
