class Task < ActiveRecord::Base
	validates :name, presence: true, length: { minimum: 2 }
	validates :desc, presence: true, length: { maximum: 1000, too_long: "%{count} is the maximum number of characters allowed." }
	validates :start_location, presence: true
	validates :destination_location, presence: true
	validates :end_location, presence: true
	validates :estimated_time, presence: true
	# validates :total_time, presence: true
	validates :started, presence: true
	validates :completed, presence: true
	validates :creator, presence: true
	validates :owner, presence: true
	# validates :passes, presence: true
	validates :group_id, presence: true
	validates :priority, presence: true
	validates :category, presence: true
	validates :karma_value, presence: true, numericality: { only_integer: true }




	has_and_belongs_to_many :groups
	#new db relation to user in replace of the polymorphic one above
	belongs_to :owner, class_name: "User", foreign_key: "owner_id"
	belongs_to :creator, class_name: "User", foreign_key: "creator_id"
	belongs_to :flaker, class_name: "User", foreign_key: "flaker_id"



end
