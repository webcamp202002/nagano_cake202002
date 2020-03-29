class Admins::OrderProductsController < Admins::BaseController
	before_action :authenticate_admin!
	def update
		@order_product = OrderProduct.find(params[:id])
		if @order_product.product_status == "wait_create" && order_product_params[:product_status] == "create"
			@order_product.order.update(order_status: 2)

			@order_product.update!(order_product_params)
			redirect_back(fallback_location: admins_order_path)
		elsif @order_product.product_status == "create" && order_product_params[:product_status] == "finish"
			@order_product.order.update(order_status: 3)
			@order_product.update!(order_product_params)
			redirect_back(fallback_location: admins_order_path)
		else
			redirect_back(fallback_location: admins_order_path)
		end
	end

	private
	def order_product_params
		params.require(:order_product).permit(:product_id,:quantity,:product_status,:price)
	end
end
