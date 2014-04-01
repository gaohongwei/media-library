class AddAltTagToMediaLibraryLinkeds < ActiveRecord::Migration
  def change
    add_column :media_library_linkeds, :alt_tag, :string
  end
end
