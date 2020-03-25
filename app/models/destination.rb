class Destination < ApplicationRecord
	belongs_to :member

	validates :postcode, presence: true
    validates :address, presence: true
    validates :name, presence: true

    def view_postcode_and_adress_and_name
    self.postcode + " " + self.address + " " + self.name
    end
end
