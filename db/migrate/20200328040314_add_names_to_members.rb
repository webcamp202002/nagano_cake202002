class AddNamesToMembers < ActiveRecord::Migration[5.2]
  def change
    add_column :members, :total_name, :string
  end
end
