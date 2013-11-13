class TasksController < ApplicationController

	before_filter :authenticate_user!

	def index
		@user = current_user
		@task = Task.find(params[:id])
		
	end

	def update

	end


end