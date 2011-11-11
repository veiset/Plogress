class SessionsController < ApplicationController

  def create_new
    subtask = Subtask.find(params[:subtask_id])
    Session.create(:description => params[:description], :duration => params[:duration], :subtask_id => subtask.id, :created => Time.now)
    redirect_to edit_subtask_path(subtask)
  end

  # GET /sessions/1/edit
  def edit
    @session = Session.find(params[:id])
    @subtask = Subtask.find(@session.subtask_id)
    access
  end

  # PUT /sessions/1
  # PUT /sessions/1.json
  def update
    @session = Session.find(params[:id])
    if (access)
      @subtask = Subtask.find(@session.subtask_id)
      respond_to do |format|
        if @session.update_attributes(params[:session])
          format.html { redirect_to edit_subtask_path(@subtask), notice: 'Session was successfully updated.' }
          format.json { head :ok }
        else
          format.html { render action: "edit" }
          format.json { render json: @session.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  def access
    @subtask = Subtask.find(@session.subtask_id)
    @task = Task.find(@subtask.task_id)
    if (session[:user].id != @task.user_id)
      flash[:error] = "You are not allowed to access this session."
      redirect_to tasks_path
      return false
    end
    return true
  end

  # DELETE /sessions/1
  # DELETE /sessions/1.json
  def destroy
    @session = Session.find(params[:id])
    if (access)
      subtask_id = @session.subtask_id
      @session.destroy
      subtask = Subtask.find(subtask_id)
      respond_to do |format|
        format.html { redirect_to edit_subtask_path(subtask) }
        format.json { head :ok }
      end
    end
  end
end
