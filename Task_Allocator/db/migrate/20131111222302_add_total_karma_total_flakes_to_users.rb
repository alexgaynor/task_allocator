class AddTotalKarmaTotalFlakesToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :tot_karma, :integer
  	add_column :users, :tot_flakes, :integer
  end
end
