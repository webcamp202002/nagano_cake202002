class CartProduct < ApplicationRecord
	belongs_to :product
	belongs_to :member
end
