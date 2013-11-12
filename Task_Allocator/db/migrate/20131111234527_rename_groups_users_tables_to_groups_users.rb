class RenameGroupsUsersTablesToGroupsUsers < ActiveRecord::Migration
  def change
  	rename_table :groups_users_tables, :groups_users
  end
end
