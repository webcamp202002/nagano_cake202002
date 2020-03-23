class Members::OrdersController <  Members::BaseController
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
		@orders = Order.where(member_id: current_membe)
	end

	def show
		@order = Order.find(params[:id])
	end

	def confirm
		@order = Order.new(order_params)
		# render :new if @order.invalid?
		if params[:address_select] == "address1"
			@order.postcode = current_member.postcode
			@order.address = current_member.address
			@order.name = current_member.last_name + current_member.first_name
		elsif
			params[:address_select] == "address2"
			@destination = Destination.find(params[:member_id])
			@order.postcode = @destination.postcode
			@order.address = @destination.address
			@order.name = @destination.name
		else
			params[:address_select] == "address3"
			@address_new = Destination.new(distination_params)
			@destination.member_id = current_member_id
			if @address_new.save
				@order.postcode = @address_new.postcode
				@order.address = @address_new.address
				@order.name = @address.name
			end
		end
		# if @order.save
		# 	redirect_to members_order_path(@order)
		# else
		# 	render 'new'
		# end

	end
	private
	def order_params
		params.require(:order).permit(:member_id,:order_status,:payment_method,:address,:postcode,:name,:postage,:billing_amount)
	end

	def destination_params
		params.require(:destination).permit(:member_id, :address, :postcode, :name, :address)
	end
end
