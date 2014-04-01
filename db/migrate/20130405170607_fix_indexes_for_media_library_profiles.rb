class FixIndexesForMediaLibraryProfiles < ActiveRecord::Migration
  def up
    remove_index "media_library_profiles", :name => "index_media_library_profiles_on_profileable_type_and_user_id"
    add_index "media_library_profiles", ["profileable_type", "profileable_id"], name: "profiles_items_index"
    add_index "media_library_profiles", "profileable_type" 
    add_index "media_library_profiles", "user_id" 
  end

  def down
    add_index "media_library_profiles", ["profileable_type", "user_id"], :name => "index_media_library_profiles_on_profileable_type_and_user_id"
  end
end
