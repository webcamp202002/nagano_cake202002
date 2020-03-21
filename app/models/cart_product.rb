class CartProduct < ApplicationRecord
	belongs_to :product
	belongs_to :member

	has_many :order_products
end
