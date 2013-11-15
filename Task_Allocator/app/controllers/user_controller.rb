class UserController < Devise::SessionsController

	def update
		current_user.update_attributes!(user_params)
		render :json => current_user
	end

	def sign_up
		if user_signed_in?
			if params[:g]
				redirect_string = "/groups/#{params[:g]}"
			else
				redirect_string = "/dashboard"
			end
			redirect_to redirect_string
		end
	end

	def sign_out
		if session["success"]
			redirect_string '/'
		else 
			redirect_string '/dashboard'
		end
		redirect_to redirect_string
	end


	private

	def user_params
		params.require(:user).permit(:firstname, :lastname, :username, :email, :phone_num) 
	end
end
