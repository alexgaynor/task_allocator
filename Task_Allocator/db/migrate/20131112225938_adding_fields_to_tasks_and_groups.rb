class AddingFieldsToTasksAndGroups < ActiveRecord::Migration
  def change
  	add_column :tasks, :due_at, :integer
  	add_column :groups, :creator_id, :integer
  end
end
