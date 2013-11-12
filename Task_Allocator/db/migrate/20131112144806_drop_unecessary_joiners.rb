class DropUnecessaryJoiners < ActiveRecord::Migration
  def change
  	drop_table :creators_tasks
  	drop_table :owners_tasks
  	drop_table :flakers_tasks
  end
end
