class RegistrationsController < Devise::RegistrationsController

  def after_sign_up_path_for(resource)
    if session[:group_id]
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
    redirect_to redirect_string
  end
end