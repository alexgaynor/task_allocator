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

end
