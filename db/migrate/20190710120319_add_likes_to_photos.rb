class AddLikesToPhotos < ActiveRecord::Migration[5.2]
  def change
    add_column :photos, :likes, :integer
    change_column_default :photos, :likes, -> { 0 }

  end
end
