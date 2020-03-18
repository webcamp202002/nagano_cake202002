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
		@product = Product.new(product_params)
		@product.save
		redirect_to admins_product_path

	end
	def edit
		@product = Product.find(params[:id])
	end
	def update
		@product = Product.find(params[:id])
	end

	def product_params
    params.require(:product).permit(:name, :unit_price, :sale_status, :image)
  end
end
