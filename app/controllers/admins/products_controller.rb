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
		# binding.pry
		@product = Product.new(product_params)
		@product.save
		redirect_to admins_products_path(@product)

	end
	def edit
		@product = Product.find(params[:id])
	end
	def update
		@product = Product.find(params[:id])
		if @product.update(product_params)
			redirect_to admins_product_path(@product)
		else
			render 'edit'
		end

	end
	def destroy
		@product = Product.find(params[:id])
		@product.destroy
		redirect_to admins_products_path
	end

	private

	def product_params
    params.require(:product).permit(:name, :unit_price, :sale_status, :image,:genre_id,:introduction)
  end
end
