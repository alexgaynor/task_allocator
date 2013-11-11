class AddExtraColumnsToTasksTable < ActiveRecord::Migration
  def change
    add_column :tasks, :accepted_at_time, :integer
    add_column :tasks, :completed_at_time, :integer
    add_column :tasks, :cost, :integer
    add_column :tasks, :flaker_id, :integer
  end
end
