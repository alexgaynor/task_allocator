class DashboardController < ApplicationController
	before_filter :authenticate_user!

	def index
		@user = current_user

		@todo_tasks = []
		@completed_tasks = []
		@user.ownertasks.each do |task|
			if task.completed == true
				@completed_tasks << task
			else
				@todo_tasks << task
			end
		end


		@group = Group.new
	end



end