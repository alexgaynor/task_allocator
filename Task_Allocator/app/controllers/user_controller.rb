class UserController < Devise::SessionsController

	# def after_sign_up_path_for(resource)
 #    if session[:group_id]
 #      group_id = session[:group_id]
 #      session.delete(:group_id)
 #      # create a way to add them to the group

 #      user = current_user
 #      group = Group.find(group_id)
 #      user.groups << group
 #      render :json => user

 #      redirect_string = "/groups/#{group_id}" 
 #    else
 #      redirect_string = "/dashboard"
 #    end
 #    redirect_to redirect_string
 #  end

	def edit
	end

	def update
		current_user.update_attributes!(user_params)
		render :json => current_user
	end

	def sign_up
		if user_signed_in?
			if params[:g]
<<<<<<< HEAD
				redirect_to '/groups/#{params[:g]}'
				    binding.pry
			else
				redirect_to "/dashboard"
				    binding.pry
=======
				redirect_string = "/groups/#{params[:g]}"
			else
				redirect_string = "/dashboard"
>>>>>>> 61a197c612003165fc573be0aed5e737f2e6fb68
			end
			redirect_to redirect_string
		end
		binding.pry
	end

	def sign_out
		if session["success"]
			redirect_to '/'
		else 
			redirect_to '/dashboard'
		end
	end


	private

	def user_params
		params.require(:user).permit(:firstname, :lastname, :username, :email, :phone_num) 
	end
end
