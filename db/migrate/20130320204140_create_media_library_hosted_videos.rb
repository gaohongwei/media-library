class CreateMediaLibraryHostedVideos < ActiveRecord::Migration
  def change
    create_table :media_library_hosted_videos do |t|
      t.string :url

      t.timestamps
    end
  end
end
