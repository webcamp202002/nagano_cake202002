class Admins::HomesController < Admins::BaseController
	before_action :authenticate_admin!
  def top
  	# @order_products = OrderProduct.where(created_at: Time.zone.today.beginning_of_day..Time.zone.today.end_of_day).to_sql
  	range = Date.today.beginning_of_day..Date.today.end_of_day
    @orders = Order.where(created_at: range)

  end
end
