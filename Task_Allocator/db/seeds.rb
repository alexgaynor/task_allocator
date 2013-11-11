require 'faker'

User.delete_all
Group.delete_all
Task.delete_all

group_types = ['friends', 'family', 'roommates', 'work buddies', 'event planners']
roles = ['friend', 'daughter', 'mom', 'dad', 'sister', 'brother']
boolean = [true, false]
priorities = ['low', 'medium', 'high']
categories = ['chore', 'pick-up', 'grocery', 'todo']

3.times do
	Group.create(
		group_name: Faker::Company.name,
		group_desc: Faker::Lorem.sentences(1).join(" "),
		homebase_location: Faker::Address.street_address,
		group_type: group_types[rand(0..4)]
	)
end

12.times do
	User.create(
		email: Faker::Internet.email,
		password: "password",
		username: Faker::Internet.user_name,
		firstname: Faker::Name.first_name,
		lastname: Faker::Name.last_name,
		nickname: "nickname",
		role: roles[rand(0..5)],
		phone_num: Faker::PhoneNumber.phone_number,
		prof_pic: Faker::Internet.url,
		group_id: rand(1..3)
		)
end

50.times do
	Task.create(
		name: Faker::Lorem.sentence(4),
		desc: Faker::Lorem.sentences(1).join(" "),
		start_location: Faker::Address.street_address,
		destination_location: Faker::Address.street_address,
		end_location: Faker::Address.street_address,
		estimated_time: 123,
		total_time: 234,
		started: boolean[rand(0..1)],
		completed: boolean[rand(0..1)],
		creator: rand(1..12),
		owner: rand(1..12),
		passes: rand(1..2),
		group_id: rand(1..3),
		priority: priorities[rand(0..2)],
		category: categories[rand(0..3)],
		karma_value: rand(0..100),
		accepted_at_time: 123456,
		completed_at_time: 456789,
		cost: 5,
		flaker_id: rand(1..12)
		)
end


