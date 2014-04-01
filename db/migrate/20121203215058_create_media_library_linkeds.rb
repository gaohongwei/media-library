class CreateMediaLibraryLinkeds < ActiveRecord::Migration
  def change
    create_table :media_library_linkeds do |t|
      t.string :type
      t.string :url

      t.timestamps
    end
  end
end
