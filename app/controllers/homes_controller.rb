class HomesController < ApplicationController
	layout 'member'
	def top
		@genres =Genre.where(status: "draft")
		@product = Product.all
		@products = @product.order("RANDUM()").limit(4)

	end

end
