class Genre < ApplicationRecord
	has_many :products
	
	enum status: { draft: false, published: true }
end
