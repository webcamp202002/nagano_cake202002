class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.integer :genre_id
      t.integer :sale_status
      t.integer :unit_price
      t.string :name
      t.text :introduction
      t.string :image_id

      t.timestamps
    end
  end
end
