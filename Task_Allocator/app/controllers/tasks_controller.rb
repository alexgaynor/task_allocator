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
			send_assignment_sms("#{task.owner.firstname}", "#{task.owner.phone_num}", "tasker.herokuapp.com/tasks/#{task.id}", "#{task.priority}", "#{task.category}", "#{task.name}", "#{task.creator.firstname}")
			render json: {task: task.to_json, creator: task.creator.to_json}
		else
			render json: task.errors, status: :unprocessable_entity 
		end
	end

	def destroy
		id = task_delete_params['task_id']
		task = Task.find(id)
		@group_id = task.group_id
		task.destroy

		redirect_to group_url
	end

	def send_assignment_sms(owner_firstname, phone_num, url, priority, category, task_name, creator_firstname)
		account_sid ='ACcdfbff925e99dd7e80d9cf05200c6baf'
  		auth_token ='150353c2cc3b539205fb41e5de42ce9c'
		@client = Twilio::REST::Client.new(account_sid, auth_token)

  		@message = @client.account.messages.create({
      		:to => "+1"+"#{phone_num}",
      		:from => "+12038830667",
      		:body => "Hey #{owner_firstname}, #{creator_firstname} has assigned you a task! The task: #{task_name}, is a #{category} with priority level #{priority}. Go to #{url} to find out more!"
    	})
	end

	def can_pass?(task)
		if task.passes < 2
			true
		else
			false
		end
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