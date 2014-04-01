class AddDefaultValueToMediaLibraryVariations < ActiveRecord::Migration
  def change
    change_column :media_library_variations, :language, :string, :default => 'en'
  end
end
