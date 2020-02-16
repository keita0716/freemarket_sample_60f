class CreditCard < ApplicationRecord
  belongs_to :user, optional: true
  validates :card_number,:card_limit_month,:card_limit_year,:security_number,presence: true
end
