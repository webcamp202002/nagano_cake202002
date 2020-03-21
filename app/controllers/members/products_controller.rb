class Members::ProductsController < Members::BaseController
	def index
		@genres = Genre.all

	if params[:genre_id]
		@products = Product.where(genre_id: params[:genre_id])
	else
		@products = Product.all
	end

	end

	def show
		@product = Product.find(params[:id])
		@cart = Product.new
	end
	def create
		 product = Product.find(params[:id])
   @cart = find_cart
   @cart.add_product(product)
   redirect_to(:action => 'display_cart')
	end


private

def product_params
    params.require(:product).permit(:name, :unit_price, :sale_status, :image,:genre_id,:introduction)
  end
  def find_cart
   session[:cart] ||= Cart.new
 end
end