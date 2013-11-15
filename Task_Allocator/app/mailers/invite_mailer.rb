class InviteMailer < ActionMailer::Base
  default from: "invites@taskalot.com"

  def group_invite (email, group)
  	@email = email
  	@group = group
  	@url = "http://localhost:3000/users/sign_up?g=#{@group.id}"
  	mail(to: @email, subject: "Tasker group invite.")
  end
end