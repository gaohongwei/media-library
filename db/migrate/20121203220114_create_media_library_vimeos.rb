class CreateMediaLibraryVimeos < ActiveRecord::Migration
  def change
    create_table :media_library_vimeos do |t|

      t.timestamps
    end
  end
end
