class Admins::ProductsController < Admins::BaseController
	def index
		@products = Products.all
	end
	def show
		@product = Product.find(params[:id])
	end
	def new
		@product = Product.new
	end
	def create
		@product = Product.new
		if @product.save
			
	end
	def edit
		@product = Product.find(params[:id])
	end
	def update
		@product = Product.find(params[:id])
	end
end
