class CreateOrderProducts < ActiveRecord::Migration[5.2]
	def change
		create_table :order_products do |t|
			t.integer :product_id
			t.integer :quantity
			t.integer :product_status, default: 0
			t.integer :price

			t.timestamps
		end
	end
end
