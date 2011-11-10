class MainController < ApplicationController
  def view
    @tasks = Task.all
    @user_tasks = Task.find_all_by_user_id(session[:user].id)
  end
end
