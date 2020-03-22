class Genre < ApplicationRecord
	has_many :products,dependent: :destroy
	
	enum status: { draft: false, published: true }
end
