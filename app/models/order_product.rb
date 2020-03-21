class OrderProduct < ApplicationRecord
	belongs_to :product
	belongs_to :order


	belongs_to :cart_products

	enum product_status:{not_create: 0,wait_create:1,create:2,finish:3}
end
