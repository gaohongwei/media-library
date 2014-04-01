class AddIndexToMediaLibraryProfiles < ActiveRecord::Migration
  def up
    add_index :media_library_profiles, :profileable_id
    add_index :media_library_profiles, [ :profileable_type, :user_id ]
  end

  def down
    remove_index :media_library_profiles, column: [ :profileable_id, :profileable_type, :user_id ]
  end
end
