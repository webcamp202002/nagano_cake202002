class Product < ApplicationRecord
	has_many :cart_products
	has_many :order_products
	belongs_to :genre

	validates :name, presence: true
    validates :introduction, presence: true
    validates :image, presence: true
    attachment :image

	enum sale_status: { sale: 0, sold_out: 1}

	
end
