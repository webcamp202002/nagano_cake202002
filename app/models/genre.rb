class Genre < ApplicationRecord
	has_many :products,dependent: :destroy
	acts_as_paranoid
	enum status: { draft: false, published: true }
end
