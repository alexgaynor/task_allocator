class CreateCreatorsTasks < ActiveRecord::Migration
  def change
    create_table :creators_tasks do |t|
    	t.integer :creator_id
    	t.integer :task_id
    end
  end
end
