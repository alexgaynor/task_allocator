class TasksController < ApplicationController

	before_filter :authenticate_user!

	def index
		@user = current_user
		@task = Task.find(params[:id])
	end

	def update
		id = task_edit_params['id']
		task = Task.find(id)
		task.update_attributes!(task_edit_params)

		render :json => task
	end

	def create
		if task = Task.create(task_params)
			render json: {task: task.to_json, creator: task.creator.to_json}
		else
			render json: task.errors, status: :unprocessable_entity 
		end
	end

	def destroy
		id = task_delete_params['task_id']
		task = Task.find(id)
		group_id = task.group_id
		group = Group.find(group_id)
		task = group.tasks.find(id)
		task.destroy

		render :json => task
	end


	private

	def task_params
		params.require(:task).permit(:name, :desc, :start_location, :destination_location, :end_location, :estimated_time, :total_time, :started, :completed, :creator_id, :owner_id, :passes, :group_id, :priority, :category, :karma_value, :created_at, :updated_at, :accepted_at_time, :completed_at_time, :cost, :flaker_id, :due_at)
	end

	def task_edit_params
		params.require(:task).permit(:id, :name, :desc, :priority, :category, :cost, :karma_value, :due_at, :start_location, :destination_location, :end_location, :estimated_time, :creator_id, :owner_id)
	end

	def task_delete_params
		params.require(:task).permit(:task_id)
	end

end