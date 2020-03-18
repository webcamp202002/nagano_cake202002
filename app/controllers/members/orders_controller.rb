class Members::OrdersController <  Members::BaseController
	def new
		@member = Member.find(params[:id])
		@order = Order.new(params[:id])
	end

	def create
		@order = Order.params[:id])
	end

	def index
	end

	def show
	end

	def confirm
		@order = Order.new(params[:id])
		
		
	end
end
