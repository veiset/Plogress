class SubtasksController < ApplicationController

  # checks if an input matches a valid duration format
  def hour_min(input_text)
    hour_regex = /^(\d+)h?$/
    minute_regex = /^((\d+)h)?([1-5][0-9]|[1-9])m?$/
    hour = 0
    minute = 0

    if (t = hour_regex.match input_text)
      hour = Integer(t[1])
    elsif (t = minute_regex.match input_text)
      if t[1]
        hour = Integer(t[2])
      end
      minute = Integer(t[3])
    end

    if (hour == 0 and minute == 0)
       return nil
    else
      return hour,minute
    end
  end


  # GET /subtasks
  # GET /subtasks.json
  def index
    @subtasks = Subtask.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @subtasks }
    end
  end

  # GET /subtasks/1
  # GET /subtasks/1.json
  def show
    @subtask = Subtask.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @subtask }
    end
  end

  # GET /subtasks/new
  # GET /subtasks/new.json
  def new
    @subtask = Subtask.new
    @subtask.task_id = params[:task_id]

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @subtask }
    end
  end

  # GET /subtasks/1/edit
  def edit
    @subtask = Subtask.find(params[:id])
  end

  # POST /subtasks
  # POST /subtasks.json
  def create
    @subtask = Subtask.new(params[:subtask])

    respond_to do |format|
      if @subtask.save
        format.html { redirect_to @subtask, notice: 'Subtask was successfully created.' }
        format.json { render json: @subtask, status: :created, location: @subtask }
      else
        format.html { render action: "new" }
        format.json { render json: @subtask.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /subtasks/1
  # PUT /subtasks/1.json
  def update
    @subtask = Subtask.find(params[:id])

    respond_to do |format|
      if @subtask.update_attributes(params[:subtask])
        format.html { redirect_to @subtask, notice: 'Subtask was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @subtask.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /subtasks/1
  # DELETE /subtasks/1.json
  def destroy
    @subtask = Subtask.find(params[:id])
    @subtask.destroy

    respond_to do |format|
      format.html { redirect_to subtasks_url }
      format.json { head :ok }
    end
  end
end
