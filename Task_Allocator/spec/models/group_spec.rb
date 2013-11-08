require 'spec_helper'

# group_name, group_description, home_address, group_type

describe Group do
  
  it "has a valid group name" do
  	group = Group.new
  	group.group_name = "The Jones Family"
  	group.save
  	group.group_name.should == "The Jones Family"
  end

  it "has a valid group description" do
  	group = Group.new
  	group.group_description = "A loving family with 3 sons and an awesome tiger-like-striped dog."
  	group.save
  	group.group_description.should == "A loving family with 3 sons and an awesome tiger-like-striped dog."
  end

  it "has a valid home address" do
  	group = Group.new
  	group.home_address = "99 Cherry Lane, New York, NY 10017"
  	group.save
  	group.home_address.should == "99 Cherry Lane, New York, NY 10017"
  end

  it "has a valid group type" do
  	group = Group.new
  	group.group_type = "family"
  	group.save
  	group.group_type.should == "family"
  end

  it "has and belongs to many users" do
		t = Group.reflect_on_association(:users)
		t.macro.should == :has_and_belongs_to_many
	end

	it "has many tasks" do
		t = Group.reflect_on_association(:tasks)
		t.macro.should == :has_many
	end

end