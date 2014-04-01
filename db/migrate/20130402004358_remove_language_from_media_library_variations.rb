class RemoveLanguageFromMediaLibraryVariations < ActiveRecord::Migration
  def up
    remove_column :media_library_variations, :language
  end

  def down
    add_column :media_library_variations, :language, :string
  end
end
