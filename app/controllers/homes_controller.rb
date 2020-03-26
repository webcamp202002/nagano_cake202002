class HomesController < ApplicationController
	layout 'member'
	def top

		@genres =Genre.where(status: "draft")
	    @products = Product.joins(:genre).where("(status = ?) AND (sale_status = ?)",false,0)

	end

end
