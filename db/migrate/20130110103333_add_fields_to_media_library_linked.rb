class AddFieldsToMediaLibraryLinked < ActiveRecord::Migration
  def change
    add_column :media_library_linkeds, :file, :string
    add_column :media_library_linkeds, :size, :string
  end
end
