class Members::ProductsController < Members::BaseController
	def index
		@products = Product.all
	end

	def show
		@product = Product.find(params[:id])
	end
end
