class CreateGroupsUsersTable < ActiveRecord::Migration
  def change
    create_table :groups_users_tables do |t|
    	t.integer :group_id
    	t.integer :task_id
    end
  end
end
