class AddOrderIdToOrderProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :order_products, :order_id, :integer
  end
end
