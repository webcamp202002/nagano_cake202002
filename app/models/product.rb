class Product < ApplicationRecord
	has_many :cart_products
	has_many :order_products
	belongs_to :genre

	enum product_status:{'sale': 0,'sold_out':1}
end
