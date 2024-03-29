class LoginController < ApplicationController
  skip_before_filter :authorize

  def start
  end

  def login
    username = params[:username]
    password = params[:password]
    user = User.find_by_username(username)

    if(user)
      if(user.authenticate(password))
        session[:user] = user
        redirect_to :controller => 'tasks'
        return
      else
        flash[:error] = "Wrong password!"
      end
    else
      flash[:error] = "User does not exist!"
    end
    redirect_to :action => 'start'
  end

  def logout
    reset_session
  end

end
