class Members::CartProductsController < Members::BaseController

	def index
		@cart_products = CartProduct.where(member_id: id)
	end

	def create
		@cart_product = current_member.cart_products.build(cart_product_params)
		@cart_product.save
		redirect_to members_cart_products_path(@cart_product)
	end

  # カート詳細画面から、「更新」を押した時のアクション
    def update
  	  @cart_product.update(quantity: params[:quantity].to_i)
  	  redirect_back(fallback_location: members_cart_products_path)
  	end

# カート詳細画面から、「削除」を押した時のアクション
    def destroy
	  @cart_product.destroy
	  members_cart_products_path
    end

    def destroy_all
	  @cart = CartProduct.find(params[member_id])
    end

  private

    def cart_product_params
	  params.require(:cart_product).permit(:member_id,:product_id,:quantity)
    end

end
