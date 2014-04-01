class CreateMediaLibraryItemProfiles < ActiveRecord::Migration
  def change
    create_table :media_library_item_profiles do |t|
      t.string :title
      t.text :description
      t.string :content_type
      t.integer :profileable_id
      t.string :profileable_type

      t.timestamps
    end
  end
end
