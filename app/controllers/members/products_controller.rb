class Members::ProductsController < Members::BaseController
	def index
		@genres = Genre.where(status: "draft")
	if params[:genre_id]
		@products = Product.where(genre_id: params[:genre_id])
	else
		@products = Product.joins(:genre).where("(status = ?) AND (sale_status = ?)",false,0)
	end

	end

	def show
		@genres = Genre.where(status: "draft")
		@product = Product.find(params[:id])
		@cart = CartProduct.new
	end


private

def product_params
    params.require(:product).permit(:name, :unit_price, :sale_status, :image,:genre_id,:introduction)
  end
end