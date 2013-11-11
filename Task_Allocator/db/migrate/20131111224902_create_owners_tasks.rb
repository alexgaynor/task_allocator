class CreateOwnersTasks < ActiveRecord::Migration
  def change
    create_table :owners_tasks do |t|
    	t.integer :owner_id
    	t.integer :task_id
    end
  end
end
