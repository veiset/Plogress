class RegisterController < ApplicationController
  def start

  end

  def register
    username = params[:username]
    password = params[:password]
    confirm_password = params[:confirm_password]

    user = User.find_by_username(username)

    error = false
    error_message = ""

    if(!user.nil?)
      error = true
      error_message += "The username already exists. "
    end
    if(username.length == 0)
      error = true
      error_message += "The username cannot be empty. "
    end
    if(password.length == 0)
      error = true
      error_message += "The password cannot be empty. "
    elsif(password != confirm_password)
      error = true
      error_message += "The passwords do not match. "
    end

    if(!error)
      user = User.new(:username => username, :password => password)
      user.save
      flash[:success] = "User successfully created."
      redirect_to :controller => 'login', :action => 'start'
      return
    else
     flash[:error] = error_message
    end
    redirect_to :action => 'start'
  end
end
