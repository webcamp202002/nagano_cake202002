class Destination < ApplicationRecord
	belongs_to :member

	validates :postcode, presence: true
    validates :address, presence: true
    validates :name, presence: true
end
