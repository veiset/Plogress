class MainController < ApplicationController
  def view
    @tasks = Task.all
    @user_tasks = Task.find_all_by_user_id(session[:user].id)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tasks }
    end
  end
end
