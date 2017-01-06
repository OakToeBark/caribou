class TaskController < ApplicationController
  before_action :authenticate_user!

  def show
    project = Project.find(params[:project_id])
    @tasks = project.tasks
    @task = @tasks.find(params[:id])

    joined = false

    # Checks to see if current user has joined the project or not
    if !current_user.nil? && !current_user.projects.nil?
      joined = current_user.projects.include?(project)
    end

    if joined

      @task = @tasks.find(params[:id])

      @next_task = @task.next
      @prev_task = @task.prev
    else
      flash[:notice] = "No permission to this" # This is where the permission bug is happening once logged in
      redirect_to project
    end
  end
end
