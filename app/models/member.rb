class Member < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         has_many :cart_products
         has_many :orders


         validates :last_name, presence: true
         validates :first_name, presence: true
         validates :kana_last_name, presence: true
         validates :kana_first_name, presence: true
         validates :postcode, presence: true
         validates :address, presence: true
         validates :phone_number, presence: true
         enum is_withdrow: { draft: false, published: true }


        def self.guest
          find_or_create_by!(email:'guest@example.com') do |member|
            member.password = SecureRamdom.urlsafe_base64
          end
        end
end
