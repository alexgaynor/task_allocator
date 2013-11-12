class FixColumnNamesInTasksTable < ActiveRecord::Migration
  def change
  	rename_column :tasks, :creator, :creator_id
  	rename_column :tasks, :owner, :owner_id
  end
end
