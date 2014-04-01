class AddUserToProfile < ActiveRecord::Migration
  def change
    add_column :media_library_profiles, :user_id, :integer
  end
end
