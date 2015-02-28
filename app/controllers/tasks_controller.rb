class TasksController < ApplicationController

  before_action :set_todo_list_id, only: [:index, :new]

  def index
  end

  def new
    @task = @todo_list.tasks.new
  end


  def create
    @todo_list = TodoList.find(params[:todo_list_id])
    @task      = @todo_list.tasks.new(task_params)
    if @task.save
      flash[:success] = "Added new task"
      redirect_to todo_list_tasks_path
    else
      flash[:error] = "There was a problem to add new task"
      render :new
    end

  end

  private

  def set_todo_list_id
    @todo_list = TodoList.find(params[:todo_list_id])
  end

  def task_params
    params[:task].permit(:content)
  end

end
