class ChangeItemProfilesToProfiles < ActiveRecord::Migration
  def up
    rename_table :media_library_item_profiles, :media_library_profiles
  end 
  
  def down
    rename_table :media_library_profiles, :media_library_item_profiles
  end
end
