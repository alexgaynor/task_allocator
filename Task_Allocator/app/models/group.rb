class Group < ActiveRecord::Base

	# validates :group_name, presence: true, length: { maximum: 55, too_long: "%{count} is the maximum number of characters allowed." }
	# validates :group_desc, presence: true, length: { maximum: 1000, too_long: "%{count} is the maximum number of characters allowed." }
	# validates :homebase_location, presence: true
	# validates :group_type, presence: true
	# validates :address_street, presence: true
	# validates :address_zipcode, presence: true, length: { maximum: 6, too_long: "%{count} is the maximum number of characters allowed." }
	# validates :address_state, presence: true, length: { maximum: 2, too_long: "%{count} is the maximum number of characters allowed." }

	has_and_belongs_to_many :users
	belongs_to :creatorgroups, class_name: "User", foreign_key: "creator_id"
	has_many :tasks

end
