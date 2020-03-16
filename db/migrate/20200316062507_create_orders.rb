class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :member_id
      t.integer :order_status, default: 0
      t.integer :payment_method
      t.string :address
      t.integer :postcode
      t.string :name
      t.integer :postage, default: 800
      t.integer :billing_amount

      t.timestamps
    end
  end
end
