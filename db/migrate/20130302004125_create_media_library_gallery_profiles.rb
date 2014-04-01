class CreateMediaLibraryGalleryProfiles < ActiveRecord::Migration
  def change
    create_table :media_library_gallery_profiles do |t|
      t.integer :gallery_id
      t.integer :profile_id

      t.timestamps
    end
  end
end
