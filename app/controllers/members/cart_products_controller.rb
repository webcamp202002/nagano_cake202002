class Member::CartProductsController < Members::BaseController
	before_action :setup_cart_item!, only: [:add_item, :update_item, :delete_item]

	def index
		@cart_products = current_cart.cart_products
	end

	def add_item
		if @cart_product.blank?
			@cart_product = current_cart.cart_products.build(product_id: params[:product_id])
		end

		@cart_product.quantity += params[:quantity].to_i
		@cart_product.save
		redirect_to current_cart
	end

  # カート詳細画面から、「更新」を押した時のアクション
    def update_item
  	  @cart_product.update(quantity: params[:quantity].to_i)
  	  redirect_to current_cart
    end

# カート詳細画面から、「削除」を押した時のアクション
    def delete_item
	  @cart_item.destroy
	  redirect_to current_cart
    end

    def destroy_all
	  @cart = CartProduct.find(params[member_id])
    end

  private

    def setup_cart_item!
	  @cart_item = current_cart.cart_items.find_by(product_id: params[:product_id])
    end
    def cart_product_params
	  params.require(:cart_product).permit(:member_id,:product_id)
    end

end
