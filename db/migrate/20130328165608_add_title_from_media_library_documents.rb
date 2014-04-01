class AddTitleFromMediaLibraryDocuments < ActiveRecord::Migration
  def change
    add_column :media_library_documents, :title, :string
  end
end
