class Members::ProductsController < Members::BaseController
	def index
	if params[:genre_id]
		@products = Product.where(genre_id: params[:genre_id])
	else
		@products = Product.all
	end

		@genres = Genre.all

	end

	def show
		@product = Product.find(params[:id])
		@cart = CartProduct.new
	end


private

def product_params
    params.require(:product).permit(:name, :unit_price, :sale_status, :image,:genre_id,:introduction)
  end
  def find_cart
   session[:cart] ||= Cart.new
 end
end