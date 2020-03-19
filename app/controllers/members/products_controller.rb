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
		@cart = Product.new
		@cart.save
		redirect to members_cart_products_path()
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