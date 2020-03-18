class Members::ProductsController < Members::BaseController
	def index
		@products = Product.all
	end

	def show
		@product = Product.find(params[:id])
		@cart = Product.new
		@cart.save
		redirect to members_cart_products_path(@cart)
	end
end
