class RegistrationsController < Devise::RegistrationsController

  def after_sign_up_path_for(resource)
    if params[:g] = session[:group_id]
      group_id = session[:group_id]
      session.delete(:group_id)
      # create a way to add them to the group

      user = current_user
      group = Group.find(group_id)
      user.groups << group
      render :json => user

      redirect_string = "/groups/#{group_id}" 
    else
      redirect_string = "/dashboard"
    end
    redirect_string
  end

  # def edit
  # end

  # def update
  #   current_user.update_attributes!(user_params)
  #   render :json => current_user
  # end

  # def create
  #   build_resource(sign_up_params)

  #   if resource.save
  #     yield resource if block_given?
  #     if resource.active_for_authentication?
  #       # set_flash_message :notice, :signed_up if is_flashing_format?
  #       sign_up(resource_name, resource)
  #       respond_with resource, :location => after_sign_up_path_for(resource)
  #     else
  #       set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_flashing_format?
  #       expire_data_after_sign_in!
  #       respond_with resource, :location => after_inactive_sign_up_path_for(resource)
  #     end
  #   else
  #     clean_up_passwords resource
  #     respond_with resource
  #   end
  # end

  # # def sign_up
  # #   if user_signed_in?
  # #     if params[:g]
  # #       redirect_to '/groups/#{params[:g]}'
  # #     else
  # #       redirect_to "/dashboard"
  # #     end
  # #   end
  # # end

  # # def sign_out
  # #   if session["success"]
  # #     redirect_to '/'
  # #   else 
  # #     redirect_to '/dashboard'
  # #   end
  # # end


  # # private

  # def user_params
  #   params.require(:user).permit(:firstname, :lastname, :username, :email, :phone_num) 
  # end
end