class AddDeletedAtToGenres < ActiveRecord::Migration[5.2]
  def change
    add_column :genres, :deleted_at, :datetime
    acts_as_paranoid
  end
end
