class CreateGroupsTasksTable < ActiveRecord::Migration
  def change
    create_table :groups_tasks do |t|
    	t.integer :group_id
    	t.integer :task_id
    end
  end
end
