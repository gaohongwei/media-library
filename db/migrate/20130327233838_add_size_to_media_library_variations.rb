class AddSizeToMediaLibraryVariations < ActiveRecord::Migration
  def change
    add_column :media_library_variations, :size, :string
  end
end
