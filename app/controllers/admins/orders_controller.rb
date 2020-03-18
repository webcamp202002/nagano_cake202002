class Admins::OrdersController < Admins::BaseController
	def index
		@orders = Order.all
		
	end
	def show
		@order = Order.find(params[:id])
	end
	def update
		
	end
	private
	def order_params
		params.require(:order).permit(:member_id,:order_status,:payment_method,:address,:postcode,:name,:postage,:billing_amount)
	end

end
