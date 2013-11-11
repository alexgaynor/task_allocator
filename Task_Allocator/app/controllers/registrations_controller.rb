class RegistrationsController < Devise::RegistrationsController

  def user_params
    params.require(:user).permit(:email, :username, :password, :password_confirmation, :firstname, :lastname, :nickname, :role, :phone_num, :prof_pic)
  end

	def create
    build_resource(user_params)

    # respond_to do |format|
    if resource.save
      if resource.active_for_authentication?
        # set_flash_message :notice, :signed_up if is_navigational_format?
        sign_up(resource_name, resource)
        render :json => {:success => true, current_user: current_user}
      else
        set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_navigational_format?
        expire_session_data_after_sign_in!
        return render :json => {:success => true}
      end
    else
      clean_up_passwords resource
      return render :json => {:success => false, :resource => resource, :errors => resource.errors}
    end
  end

  # Signs in a user on sign up. You can overwrite this method in your own
  # RegistrationsController.
  def sign_up(resource_name, resource)
    sign_in(resource_name, resource)
  end

end
