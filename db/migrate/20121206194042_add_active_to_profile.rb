class AddActiveToProfile < ActiveRecord::Migration
  def change
    add_column :media_library_profiles, :active, :boolean, default: true
  end
end
