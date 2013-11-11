class Group < ActiveRecord::Base

	validates :group_name, presence: true, length: { maximum: 55, too_long: "%{count} is the maximum number of characters allowed." }
	validates :group_desc, presence: true, length: { maximum: 1000, too_long: "%{count} is the maximum number of characters allowed." }
	validates :homebase_location, presence: true
	validates :group_type, presence: true

	has_and_belongs_to_many :users
	has_many :tasks

end