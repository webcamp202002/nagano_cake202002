class Order < ApplicationRecord
	belongs_to :member
	has_many :order_products, dependent: :destroy
	has_many :products, through: :ordere_products
	accepts_nested_attributes_for :order_products,allow_destroy: true
	enum payment_method:{card: 0,bank:1}
	enum order_status:{wait: 0,confirm:1,start:2,preparation:3,finish:4}

    validates :name, presence: true
    validates :postcode, presence: true
    validates :address, presence: true

    def total
    	total_price = 0
    	cart_products = current_member.cart_products
        cart_products.each do |cart_product|

        total_price += (cart_product.product.unit_price * cart_product.quantity)
        sum = (@total_price *1.1).round
    end
    end

    def amount
    	order.billing_amount = ((@total_price *1.1).round) + 800
    end
end
