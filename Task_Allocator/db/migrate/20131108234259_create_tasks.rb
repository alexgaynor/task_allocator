class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.string :desc
      t.string :start_location
      t.string :destination_location
      t.string :end_location
      t.integer :estimated_time
      t.integer :total_time
      t.boolean :started
      t.boolean :completed
      t.integer :creator
      t.integer :owner
      t.integer :passes
      t.integer :group_id
      t.string :priority
      t.string :category
      t.integer :karma_value

      t.timestamps
    end
  end
end
