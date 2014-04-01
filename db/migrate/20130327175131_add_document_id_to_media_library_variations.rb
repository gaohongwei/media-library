class AddDocumentIdToMediaLibraryVariations < ActiveRecord::Migration
  def change
    add_column :media_library_variations, :document_id, :int
  end
end
