require 'spec_helper'

# name, desc, cost, start_location, end_location, destination_location, 
# estimated_time, total_time, started, completed, creator, owner, passes
# group_id, priority, category, karma_value 

describe Task do
  it "has a name attribute" do
  	task = Task.new
  	task.name = "Pick up Milk"
  	task.save
  	task.name.should == "Pick up Milk"
  end

  it "has a desc attribute" do
  	task = Task.new
  	task.desc = "Would someone please pick up the milk at A&P"
  	task.save
  	task.desc.should == "Would someone please pick up the milk at A&P"
  end

  it "has a start_location attribute" do
  	task = Task.new
  	task.start_location = "10 East 21st street, NY, NY"
  	task.save
  	task.start_location.should == "10 East 21st street, NY, NY"
  end

  it "has a destination_location attribute" do
  	task = Task.new
  	task.destination_location = "Harvey School"
  	task.save
  	task.destination_location.should == "Harvey School"
  end

  it "has a end_location attribute" do
  	task = Task.new
  	task.end_location = "Home"
  	task.save
  	task.end_location.should == "Home"
  end

  it "has a estimated_time attribute" do
  	task = Task.new
  	task.estimated_time = 7200
  	task.save
  	task.estimated_time.should == 7200
  end

  it "has a accept_time attribute" do 
  	task = Task.new
  	task.accept_time = Time.new(2013, 11, 10, 5, 30)
  	task.save
  	task.accept_time.should == Time.gm(2013, 11, 10, 5, 30)
  end

  it "has a complete_time attribute" do
  	task = Task.new
  	task.complete_time = Time.new(2013, 11, 10, 6, 30)
  	task.save
  	task.complete_time.should == Time.gm(2013, 11, 10, 5, 30)
  end

  it "has a started attribute" do
  	task = Task.new
  	task.started = true
  	task.save
  	task.started.should == true
  end

  it "has a ended attribute" do
  	task = Task.new
  	task.ended = false
  	task.save
  	task.ended.should == false
  end

  it "has a creator attribute" do
  	task = Task.new
  	task.assigner = 5039283
  	task.save
  	task.assigner.should == 5039283
  end

  it "has a owner attribute" do
  	task = Task.new
  	task.owner = 393838
  	task.save
  	task.owner.should == 393838
  end

  it "has a passes attribute" do
  	task = Task.new
  	task.passes = 2
  	task.save
  	task.passes.should == 2
  end


  it "has a group_id attribute" do
  	task = Task.new
  	task.group_id = 74893
  	task.save
  	task.group_id.should == 74893
  end

  it "has a priority attribute" do
  	task = Task.new
  	task.priority = "Urgent"
  	task.save
  	task.group_id.should == "Urgent"
  end

  it " has a category attribute" do
  	task = Task.new
  	task.category = 'errand'
  	task.save
  	task.category.should == 'errand'
  end

  it "has a karma_value attribute" do
  	task = Task.new
  	task.karma_value = 300
  	task.save
  	task.karma_value.should == 300
  end

  it "has and belongs to many groups" do
  	t = Task.reflect_on_association(:groups)
  	t.macro.should == :has_and_belongs_to_many
  end

  it "has and belongs to many users" do
  	t = Task.reflect_on_association(:users)
  	t.macro.should == :has_and_belongs_to_many
  end
end
