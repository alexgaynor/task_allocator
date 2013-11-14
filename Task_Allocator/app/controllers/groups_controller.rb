class GroupsController < ApplicationController

	before_filter :authenticate_user!

	def index
		@user = current_user
		id = params[:id]
		@group = Group.find(id)
		@members = @group.users
		@task_categories = ['chore', 'pick-up', 'grocery', 'todo']

		@member = User.new

		if @user.id == @group.creator_id
			@is_creator = true
		end

		@tasks_todo = []
		@completed_tasks = []
		@tasks_in_prog = []
		@tasks = Task.where(group_id: id).order(:created_at)

		@tasks.each do |task|
			if !task.started
				@tasks_todo << task
			elsif task.completed 
				@completed_tasks << task
			elsif task.started && !task.completed
				@tasks_in_prog << task
			end
		end

		@task = Task.new
	end

	def create
		group = Group.create(group_params)
		group.creator_id = current_user.id
		group.homebase_location = "#{group.address_street} #{group.address_zipcode} #{group.address_state}"
		group.save
		current_user.groups << group
		respond_to do |format|
			if group.save
				format.json { render json: group, status: :created }
			else
				format.json { render json: group.errors, status: :unprocessable_entity }
			end
		end

	end

	def update

	end

	def add_member
		id = members_params['group_id']
		@group = Group.find(id)
		members = @group.users

		email = members_params['email']
		
		if user = User.find_by_email(email)
			group = Group.find(id)
			user.groups << group

			render :json => user

		else
			# send out email to join
		end
	end

	private

	def group_params
		params.require(:group).permit(:group_name, :group_desc, :address_street, :address_zipcode, :address_state, :group_type)
	end

	def members_params
		params.require(:new_members).permit(:email, :group_id)
	end

end