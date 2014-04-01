class AddDefaultToActiveToMediaLibraryVariations < ActiveRecord::Migration
  def up
      change_column :media_library_variations, :active, :boolean, :default => true
  end

  def down
      change_column :media_library_variations, :active, :boolean, :default => nil
  end
end
