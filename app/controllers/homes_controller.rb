class HomesController < ApplicationController
	layout 'member'
	def top
		@genres =Genre.where(status: "draft")
		@products = Product.order("RANDUM()").limit(4)

	end

end
