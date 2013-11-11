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
	validates :karma_value, presence: true, numerically: { only_integer: true }


	belongs_to :users, polymorphic: true
	has_many :users, as: :creator
	has_many :users, as: :owner

	has_and_belongs_to_many :groups


end
