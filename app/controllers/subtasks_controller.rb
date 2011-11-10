class SubtasksController < ApplicationController

  def create_new
    test = params[:task_id].first[0]
    task = Task.find(test)
    Subtask.create(:title => params[:title], :proficiency => params[:proficiency][:proficiency], :task_id => test, :created => Time.now)
    redirect_to edit_task_path(task)
  end

  # GET /subtasks/1/edit
  def edit
    @subtask = Subtask.find(params[:id])
    @task = Task.find(@subtask.task_id)
    access
  end

  # PUT /subtasks/1
  # PUT /subtasks/1.json
  def update
    @subtask = Subtask.find(params[:id])
    if (access)
      @subtask.proficiency = params[:proficiency][:proficiency]

      respond_to do |format|
        if @subtask.update_attributes(params[:subtask])
          format.html { redirect_to edit_subtask_path(@subtask), notice: 'Subtask was successfully updated.' }
          format.json { head :ok }
        else
          format.html { render action: "edit" }
          format.json { render json: @subtask.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  def access
    @task = Task.find(@subtask.task_id)
    if (session[:user].id != @task.user_id)
      flash[:error] = "You are not allowed to access this subtask."
      redirect_to tasks_path
      return false
    end
    return true
  end

  # DELETE /subtasks/1
  # DELETE /subtasks/1.json
  def destroy
    @subtask = Subtask.find(params[:id])
    if (access)
      task_id = @subtask.task_id
      @subtask.destroy
      task = Task.find(task_id)

      respond_to do |format|
        format.html { redirect_to edit_task_path(task) }
        format.json { head :ok }
      end
    end
  end
end
