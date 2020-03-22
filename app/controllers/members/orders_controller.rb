class Members::OrdersController <  Members::BaseController
	def new
	    @order = Order.new
	    @address = current_member.destinations
		@destination = Destination.where(member_id: current_member)
	end

	def create
		@order = Order.new(order_params)
	end

	def index
		@orders = Order.all
	end

	def show
	end

	def confirm
		@order = Order.new(order_params)
		@member = current_memberber
		@address = @member.destinations
		if params[:address_select] == "adress1"


		elsif
			params[:address_select] == "adress2"
			@cart_products = CartProduct.where(member_id: current_member)

		else
			params[:address_select] == "adress3"

		end

	end
	private
	def order_params
		params.require(:order).permit(:member_id,:order_status,:payment_method,:address,:postcode,:name,:postage,:billing_amount)
	end
end
