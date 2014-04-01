class AddThumbnailUrlToMediaLibraryHostedVideos < ActiveRecord::Migration
  def change
    add_column :media_library_hosted_videos, :thumbnail_url, :string
  end
end
