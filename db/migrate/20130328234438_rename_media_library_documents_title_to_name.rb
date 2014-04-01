class RenameMediaLibraryDocumentsTitleToName < ActiveRecord::Migration
  def up
    rename_column :media_library_documents, :title, :name
  end

  def down
    rename_column :media_library_documents, :name, :title
  end
end
