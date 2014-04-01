class CreateMediaLibraryGalleries < ActiveRecord::Migration
  def change
    create_table :media_library_galleries do |t|
      t.string :title
      t.text :description
      t.integer :user_id

      t.timestamps
    end
  end
end
