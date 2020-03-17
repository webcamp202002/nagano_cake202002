class Genre < ApplicationRecord
	has_many :products

	validates :status, inclusion: {in: [true, false]}
end
