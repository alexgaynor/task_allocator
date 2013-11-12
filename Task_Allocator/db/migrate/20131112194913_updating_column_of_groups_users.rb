class UpdatingColumnOfGroupsUsers < ActiveRecord::Migration
  def up
  	rename_column :groups_users, :task_id, :user_id
  end

  def down
  	rename_column :groups_users, :user_id, :task_id
  end
end
