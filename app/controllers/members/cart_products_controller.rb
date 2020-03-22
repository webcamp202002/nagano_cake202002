class Members::CartProductsController < Members::BaseController

	def index
		@cart_product = CartProduct.new
		@cart_products = CartProduct.where(member_id: current_member)
		
	end

	def create
		@cart_product = CartProduct.new(cart_product_params)
		@cart_product.member_id = current_member.id
		@cart_product.save
		redirect_to members_cart_products_path(@cart_product)
	end

  # カート詳細画面から、「更新」を押した時のアクション
    def update
      @cart_product = CartProduct.find(params[:id])
  	  @cart_product.update!(cart_product_params)
  	  @member = Member.find(current_member.id)
  	  redirect_back(fallback_location: members_cart_products_path)
  	end

# カート詳細画面から、「削除」を押した時のアクション
    def destroy
      @cart_product = CartProduct.find(params[:id])
	  @cart_product.destroy
	  redirect_back(fallback_location: members_cart_products_path)
    end

    def destroy_all
	  member = Member.find(current_member.id)
	 if member.cart_products.destroy_all
	 	flash[:notice] = "カートの商品を全て削除しました。"
	  redirect_to members_products_path
	else
		render 'index'
	end
    end

  private

    def cart_product_params
	  params.require(:cart_product).permit(:member_id,:product_id,:quantity)
    end

end
