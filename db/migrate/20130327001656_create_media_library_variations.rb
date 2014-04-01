class CreateMediaLibraryVariations < ActiveRecord::Migration
  def change
    create_table :media_library_variations do |t|
      t.string :language
      t.string :file

      t.timestamps
    end
  end
end
