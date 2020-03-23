class Members::OrdersController <  Members::BaseController
	before_action :authenticate_member!
	def new
	    @order = Order.new
	    @address = current_member.destinations
		@destination = Destination.where(member_id: current_member)
	end

	def create
		@order = Order.new(order_params)
	    @order.save
		  redirect_to members_menber_finish_path
    end
	def index
		@orders = Order.where(member_id: current_member)
	end

	def show
		@order = Order.find(params[:id])
	end

	def confirm
		@order = Order.new(order_params)
		@cart_products = current_member.cart_products
		@order.member_id = current_member.id
		if params[:address_select] == "address1"
			@order.postcode = current_member.postcode
			@order.address = current_member.address
			@order.name = current_member.last_name + current_member.first_name
		elsif params[:address_select] == "address2"
			@destination = Destination.find(params[:order][:address_id])
			@order.postcode = @destination.postcode
			@order.address = @destination.address
			@order.name = @destination.name
		else
			params[:address_select] == "address3"
			@order.postcode =  params[:order][:destination][:postcode]
		    @order.address =  params[:order][:destination][:address]
			@order.name =  params[:order][:destination][:name]
		end
    @total_price = 0
    @cart_products.each do |cart_product|

    @total_price += (cart_product.product.unit_price * cart_product.quantity)
    end

    @order.billing_amount = ((@total_price *1.1).round) + 800

	end
	private
	def order_params
		params.require(:order).permit(:member_id,:order_status,:payment_method,:address,:postcode,:name,:postage,:billing_amount)
	end

	def destination_params
		params.require(:destination).permit(:member_id, :address, :postcode, :name, :address)
	end
end
