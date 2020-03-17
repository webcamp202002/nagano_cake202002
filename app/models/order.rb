class Order < ApplicationRecord
	belongs_to :member
	has_many :order_productss
	enum payment_method:{'card': 0,'bank':1}
	enum order_status:{'wait': 0,'confirm':1,'create':2,'preparation':3,'finish':4}
end
