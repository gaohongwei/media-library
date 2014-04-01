class CreateMediaLibraryImages < ActiveRecord::Migration
  def change
    create_table :media_library_images do |t|
      t.string :alt_tag
      t.string :file
      t.string :size

      t.timestamps
    end
  end
end
