class AddStreetZipStateToGroups < ActiveRecord::Migration
  def change
  	add_column :groups, :address_street, :string
  	add_column :groups, :address_zipcode, :integer
  	add_column :groups, :address_state, :string
  end
end
