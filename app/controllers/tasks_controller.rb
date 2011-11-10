class TasksController < ApplicationController
  # GET /tasks
  # GET /tasks.json
  def index
    @tasks = Task.all
    @user_tasks = Task.find_all_by_user_id(session[:user].id)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tasks }
    end
  end

  def create_new
    @task = Task.create(:title => params[:title], :user_id => session[:user].id, :proficiency => params[:proficiency][:proficiency], :created => Time.now)
    redirect_to :action => 'index'
  end

  # GET /tasks/1/edit
  def edit
    @task = Task.find(params[:id])
  end

  # PUT /tasks/1
  # PUT /tasks/1.json
  def update
    @task = Task.find(params[:id])
    @task.proficiency = params[:proficiency][:proficiency]

    respond_to do |format|
      if @task.update_attributes(params[:task])
        format.html { redirect_to edit_task_path(@task), notice: 'Task was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task = Task.find(params[:id])
    @task.destroy

    respond_to do |format|
      format.html { redirect_to tasks_url }
      format.json { head :ok }
    end
  end
end
