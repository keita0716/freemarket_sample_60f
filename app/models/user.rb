class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nickname, :family_name, :first_name,:family_kana_name,:first_kana_name,:birth_year,:birth_month,:birth_day ,presence: true
  has_one :address
  has_one :authentication_phonenumber
end
