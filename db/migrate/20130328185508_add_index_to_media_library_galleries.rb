class AddIndexToMediaLibraryGalleries < ActiveRecord::Migration
  def up
    add_index :media_library_galleries, :user_id
  end

  def down
    remove_index :media_library_galleries, column: :user_id
  end
end
