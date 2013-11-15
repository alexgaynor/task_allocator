class InviteMailer < ActionMailer::Base
  default from: "invites@taskalot.com"

  def group_invite (email, group)
  	@email = email
  	@group = group
  	@group_id = @group.id
  	@url = "http://localhost:3000/users/sign_up?g=#{@group_id}"
  	mail(to: @email, subject: "Taskalot group invite.")
  end

end