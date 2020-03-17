class Member < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         has_many :cart_products
         has_many :orders

         validates :status, inclusion: {in: [true, false]}
         validate :last_name, presence: true
         validate :first_name, presence: true
         validate :kana_last_name, presence: true
         validate :kana_first_name, presence: true
         validate :postcode, presence: true
         validate :adress, presence: true
         validate :phone_number, presence: true
end
