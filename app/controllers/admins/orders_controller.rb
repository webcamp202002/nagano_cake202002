class Admins::OrdersController < Admins::BaseController

	def index
		@orders = Order.all

	end
	def show
		@order = Order.find(params[:id])
		@total_price = 0
        @order.order_products.each do |order_product|
          @total_price += (order_product.product.unit_price * order_product.quantity)
        end

	end
	def update
		@order = Order.find(params[:id])
		if @order.order_status == "wait" && order_params[:order_status] == "confirm"
				@order.order_products.each do |order_product|
			         order_product.product_status = 1
			    end
			@order.update!(order_params)
			redirect_back(fallback_location: admins_order_path)
		elsif @order.order_status == "preparation" && order_params[:order_status] == "finish"
			@order.update!(order_params)
			redirect_back(fallback_location: admins_order_path)
  	    else
  	    	redirect_back(fallback_location: admins_order_path)
  	    end
  end
	private
	def order_params
		params.require(:order).permit(:member_id,:order_status,:payment_method,:address,:postcode,:name,:postage,:billing_amount,order_products_attributes: [:product_id, :quantity, :product_status, :price])
	end

end
