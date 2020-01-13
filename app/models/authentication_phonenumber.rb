class AuthenticationPhonenumber < ApplicationRecord
  belongs_to :user, optional: true
end
