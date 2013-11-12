class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # allows user to sign in with username OR email
  def self.find_for_database_authentication(conditions={})
  	self.where("username = ?", conditions[:email]).limit(1).first ||
  	self.where("email = ?", conditions[:email]).limit(1).first
	end

  has_and_belongs_to_many :groups
  #check to make sure that the owner/creator/flaker 
  #have been changed to owner_id/creator_id/flaker_id respectively
  has_many :ownertasks, class_name: "Task", foreign_key: "owner_id"
  has_many :creatortasks, class_name: "Task", foreign_key: "creator_id"
  has_many :flakertasks, class_name: "Task", foreign_key: "flaker_id"
end
