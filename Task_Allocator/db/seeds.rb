require 'faker'

User.delete_all
Group.delete_all
Task.delete_all

group_types = ['friends', 'family', 'roommates', 'work buddies', 'event planners']
roles = ['friend', 'daughter', 'mom', 'dad', 'sister', 'brother']
boolean = [true, false]
priorities = ['low', 'medium', 'high']
categories = ['chore', 'pick-up', 'grocery', 'todo']
photos = ['http://photos2.meetupstatic.com/photos/member/a/7/c/member_10382684.jpeg', 'https://ga-core.s3.amazonaws.com/production/uploads/instructor/image/1475/li-omardelarosa.jpg', 'https://d3o09jpaxs6yh2.cloudfront.net/production/assets/people/wdi/andrew-madden-3033a86f0ab489c5c3a008d75380156e.jpg']
groups_arr = []
users_arr = []
tasks_arr = []

3.times do
	groups_arr << Group.create(
		group_name: Faker::Company.name,
		group_desc: Faker::Lorem.sentences(1).join(" "),
		homebase_location: Faker::Address.street_address,
		address_street: Faker::Address.street_address,
		address_zipcode: Faker::Address.zip,
		address_state: Faker::Address.state_abbr,
		group_type: group_types[rand(0..4)]
	)
end

12.times do
	user = User.create(
		email: Faker::Internet.email,
		password: "password",
		username: Faker::Internet.user_name,
		firstname: Faker::Name.first_name,
		lastname: Faker::Name.last_name,
		nickname: "nickname",
		role: roles[rand(0..5)],
		phone_num: Faker::PhoneNumber.phone_number,
		prof_pic: photos[rand(0..2)]
	)
	user.groups << groups_arr.sample
	users_arr << user
end

50.times do
	task = Task.create(
		name: Faker::Lorem.sentence(4),
		desc: Faker::Lorem.sentences(1).join(" "),
		start_location: Faker::Address.street_address,
		destination_location: Faker::Address.street_address,
		end_location: Faker::Address.street_address,
		estimated_time: 123,
		total_time: 234,
		started: boolean[rand(0..1)],
		completed: boolean[rand(0..1)],
		creator_id: users_arr.sample.id,
		owner_id: users_arr.sample.id,
		passes: rand(1..2),
		group_id: groups_arr.sample.id,
		priority: priorities[rand(0..2)],	
		category: categories[rand(0..3)],
		karma_value: rand(0..100),
		accepted_at_time: 123456,
		completed_at_time: 456789,
		cost: 5,
		flaker_id: users_arr.sample.id,
	)
	tasks_arr << task
end





