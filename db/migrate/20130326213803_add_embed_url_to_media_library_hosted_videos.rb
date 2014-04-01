class AddEmbedUrlToMediaLibraryHostedVideos < ActiveRecord::Migration
  def change
    add_column :media_library_hosted_videos, :embed_url, :string
  end
end
