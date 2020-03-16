class CreateDestinations < ActiveRecord::Migration[5.2]
  def change
    create_table :destinations do |t|
      t.integer :member_id
      t.string :address
      t.string :postcode
      t.string :name

      t.timestamps
    end
  end
end
