class AuthenticationPhonenumber < ApplicationRecord
  belongs_to :user, optional: true
  validates :authentication_phonenumber,presence: true
end
