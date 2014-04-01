class AddActiveToMediaLibraryVariations < ActiveRecord::Migration
  def change
    add_column :media_library_variations, :active, :boolean
  end
end
