class CreateMediaLibraryVideos < ActiveRecord::Migration
  def change
    create_table :media_library_videos do |t|
      t.string :file
      t.string :size

      t.timestamps
    end
  end
end
