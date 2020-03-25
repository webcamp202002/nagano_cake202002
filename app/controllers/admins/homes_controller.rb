class Admins::HomesController < Admins::BaseController
  def top
  	@order_products = OrderProduct.where(created_at: Time.zone.today.beginning_of_day..Time.zone.today.end_of_day).to_sql

  end
end
