class TasksController < ApplicationController

  before_action :set_todo_list_id
  before_action :set_task_id, except: [:create]


  def new
    @task = @todo_list.tasks.new
  end


  def create
    @task = @todo_list.tasks.new(task_params)
    respond_to do |format|
      if @task.save
        format.html {redirect_to @todo_list, notice: "Added new task" }
        format.json {render json: @task, status: :created, location: @task }
        format.js
      else
        format.html {render action: "new"}
        format.json {render json: @task.errors, status: :unprocessable_entity}
        format.js
      end
    end
  end

  def destroy
    respond_to do |format|
      @task.destroy
        format.html { redirect_to todo_list_path(@todo_list), notice: 'Task was successfully destroyed.' }
        format.json { head :no_content }
        format.js
    end

  end

  def complete
    respond_to do |format|
      if @task.completed_at.nil?

        @task.update_attributes(completed_at: Time.now)

        format.html { redirect_to todo_list_path(@todo_list), notice: 'Task done' }
        format.json { render @task, status: :done, location: @task }
      else
        @task.update_attributes(completed_at: nil)

        format.html { redirect_to todo_list_path(@todo_list), notice: 'Task undone' }
        format.json { render @todo_list, status: :undone, location: @task }
      end
    end
  end



  private

  def set_todo_list_id
    @todo_list = TodoList.find(params[:todo_list_id])
  end

  def set_task_id
    @task = @todo_list.tasks.find(params[:id])
  end

  def task_params
    params[:task].permit(:content)
  end

end
