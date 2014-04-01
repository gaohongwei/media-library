class RemoveFieldFromMediaLibraryDocuments < ActiveRecord::Migration
  def up
    remove_column :media_library_documents, :size
    remove_column :media_library_documents, :file
  end

  def down
    add_column :media_library_documents, :file, :string
    add_column :media_library_documents, :size, :string
  end
end
