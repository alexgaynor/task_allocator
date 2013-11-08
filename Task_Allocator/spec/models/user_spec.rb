require 'spec_helper'

# username, firstname, lastname, nickname, email, password, phone_num, prof_pic

describe User do
  
  it "has a valid username" do
  	user = User.new
  	user.username = "Alex123"
  	user.save
  	user.username.should == "Alex123"
	end

	it "has a valid first name" do
		user = User.new
		user.firstname = "Alex"
		user.save
		user.firstname.should == "Alex"
	end

	it "has a valid last name" do
		user = User.new
		user.lastname = "Jones"
		user.save
		user.lastname.should == "Jones"
	end

	it "has a valid nick name" do
		user = User.new
		user.nickname = "A-dawg"
		user.save
		user.nickname.should == "A-dawg"
	end

	it "has a valid email" do
		user = User.new
		user.email = "alex123@test.com"
		user.save
		user.email.should == "alex123@test.com"
	end

	it "has a valid password" do
		user = User.new
		uesr.password = "password"
		user.save
		user.password.should == "password"
	end

	it "has a valid phone number" do
		user = User.new
		user.phone_num = "(516)867-5309"
		user.save
		user.phone_num.should == "(516)867-5309"
	end

	it "has a valid profile picture url" do
		user = User.new
		user.prof_pic = "image.jpg"
		user.save
		user.prof_pic == "image.jpg"
	end

	it "has and belongs to many groups" do
		t = User.reflect_on_association(:groups)
		t.macro.should == :has_and_belongs_to_many
	end

	it "has many tasks" do
		t = User.reflect_on_association(:tasks)
		t.macro.should == :has_many
	end

end