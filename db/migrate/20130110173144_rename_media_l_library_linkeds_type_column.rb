class RenameMediaLLibraryLinkedsTypeColumn < ActiveRecord::Migration
  def change
    rename_column :media_library_linkeds, :type, :media_type
  end
end
