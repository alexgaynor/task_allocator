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
	end

	def create
		@group = Group.new(params[:group])

		respond_to do |format|
			if @group.save
				format.html { redirect_to @group, notice: 'Group was successfully created.' }
				format.json { render json: @group, status: :created }
			else
				format.json { render json: @group.errors, status: :unprocessable_entity }
			end
		end

	end

	def update

	end

end