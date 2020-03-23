class Admins::OrderProductsController < Admins::BaseController

	def update
		@order_product = OrderProduct.find()
	end

	private
	def order_product_params
		params.require(:order_product).permit(:product_id,:quantity,:product_status,:price)
	end
end
