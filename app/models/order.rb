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

    def count
    sum = 0
    self.order_products.each do |order_products|
    sum += order_products.quantity
    end
    end
end
