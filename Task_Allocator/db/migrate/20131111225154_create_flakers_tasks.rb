class CreateFlakersTasks < ActiveRecord::Migration
  def change
    create_table :flakers_tasks do |t|
    	t.integer :flaker_id
    	t.integer :task_id
    end
  end
end
