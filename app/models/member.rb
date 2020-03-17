class Member < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         has_many :cart_products
         has_many :orders

         validates :is_withdraw, inclusion: {in: [true, false]}
         validates :last_name, presence: true
         validates :first_name, presence: true
         validates :kana_last_name, presence: true
         validates :kana_first_name, presence: true
         validates :postcode, presence: true
         validates :adress, presence: true
         validates :phone_number, presence: true
end
