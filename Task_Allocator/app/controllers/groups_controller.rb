class GroupsController < ApplicationController

	before_filter :authenticate_user!

	def index
		@user = current_user

		id = params[:id]
		@group = Group.find(id)

		@members = @group.users


		@tasks_todo = []
		@completed_tasks = []
		@tasks_in_prog = []
		@tasks = Task.where(group_id: id)

		@tasks.each do |task|
			if !task.started
				@tasks_todo << task
			elsif task.completed 
				@completed_tasks << task
			elsif task.started && !task.completed
				@tasks_in_prog << task
			end	
		end
		@group = Group.new
	end

	def create

	end

	def update

	end

end