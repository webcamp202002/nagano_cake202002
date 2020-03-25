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

        @order.billing_amount = ((@total_price *1.1).round) + 800

	end
	def update
		@order = Order.find(params[:id])
		if @order.order_product.product_status == 2
			@order.order_status = 2
			@order.update!(order_params)
			redirect_to admins_order_product_path(@order)
		elsif @order.order_product.product_status == 3
			@order.order_status = 3
			@order.update!(order_params)
			redirect_to admins_order_product_path(@order)
		elsif @order.order_status == 1
			@order.update!(order_params)
			redirect_to admins_order_product_path(@order)
		else
  	    @order.update!(order_params)
  	    redirect_back(fallback_location: admins_order_path)
  	end
  end
	private
	def order_params
		params.require(:order).permit(:member_id,:order_status,:payment_method,:address,:postcode,:name,:postage,:billing_amount,order_products_attributes: [:product_id, :quantity, :product_status, :price])
	end

end
