class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.string :desc
      t.string :start_location
      t.string :destination_location
      t.string :end_location
      t.int :estimated_time
      t.int :total_time
      t.boolean :started
      t.boolean :completed
      t.int :creator
      t.int :owner
      t.int :passes
      t.int :group_id
      t.string :priority
      t.string :category
      t.int :karma_value

      t.timestamps
    end
  end
end
