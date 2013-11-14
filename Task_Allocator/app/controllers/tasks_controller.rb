class TasksController < ApplicationController

	before_filter :authenticate_user!

	def index
		@user = current_user
		@task = Task.find(params[:id])
		
	end

	def update

	end

	def create
		if task = Task.create(task_params)
			render json: {task: task.to_json, creator: task.creator.to_json}
		else
			render json: task.errors, status: :unprocessable_entity 
		end
		
	end


	private

	def task_params
		params.require(:task).permit(:name, :desc, :start_location, :destination_location, :end_location, :estimated_time, :total_time, :started, :completed, :creator_id, :owner_id, :passes, :group_id, :priority, :category, :karma_value, :created_at, :updated_at, :accepted_at_time, :completed_at_time, :cost, :flaker_id, :due_at)
	end

end