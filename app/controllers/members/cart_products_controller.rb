class Menber::CartProductsController < Members::BaseController
	def index
		@cart = session[:cart]
	end

	def create

	end

	def update
	end

	def destroy
	end

	def destroy_all
		@cart = Cart.find(params[:id])
	end
	private
	def cart_product_params
		params.require(:cart_product).permit(:member_id,:product_id)
	end
	def find_cart
   session[:cart] ||= Cart.new
 end
end
