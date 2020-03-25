class Admins::OrderProductsController < Admins::BaseController

	def update
		@order_product = OrderProduct.find(params[:id])
		if @order_product.order.order_status == 1 && [:order_product_params][:product_status] == 2
			@order_product.order.order_status = 
			@order_product.update!(order_product_params)
			redirect_to admins_order_path(@order)
		else
			@order_product.update!(order_product_params)
			redirect_to admins_order_path(@order)
	end

	private
	def order_product_params
		params.require(:order_product).permit(:product_id,:quantity,:product_status,:price)
	end
end
