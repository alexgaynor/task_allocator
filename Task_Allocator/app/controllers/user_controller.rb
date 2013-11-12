class UserController < ApplicationController

	def update
		current_user.update_attributes!(user_params)
		render :json => current_user
	end

	private

	def user_params
		params.require(:user).permit(:firstname, :lastname, :username, :email, :phone_num) 
	end
end
