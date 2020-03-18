class Admins::ProductsController < Admins::BaseController
	def index
		@products = Product.all
	end
	def show
		@product = Product.find(params[:id])
	end
	def new
		@product = Product.new
	end
	def create
		@product = Product.new
		@product.save
		redirect_to admins_product_path(@product)

	end
	def edit
		@product = Product.find(params[:id])
	end
	def update
		@product = Product.find(params[:id])
	end
end
