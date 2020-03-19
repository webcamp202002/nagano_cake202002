class Members::ProductsController < Members::BaseController
	def index
	if params[:genre_id]
		@products = Product.where(genre_id: params[:genre:id])
	else
		@products = Product.all
	end

		@henres = Genre.all

	end

	def show
		@product = Product.find(params[:id])
		@cart = Product.new
		@cart.save
		redirect to members_cart_products_path(@cart)
	end


private

def product_params
    params.require(:product).permit(:name, :unit_price, :sale_status, :image,:genre_id,:introduction)
  end
end