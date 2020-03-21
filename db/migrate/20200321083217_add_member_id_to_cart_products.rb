class AddMemberIdToCartProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :cart_products, :member_id, :integer
  end
end
