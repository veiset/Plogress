class LoginController < ApplicationController
  def start
  end

  def login
    username = params[:username]
    password = params[:password]
    user = User.find_by_username(username)
    if(!user.nil?)
      if(user.password.eql? password)
        session[:user] = user
        redirect_to :controller => 'main', :action => 'view'
        return
      else
        flash[:error] = "Wrong password!"
      end
    else
      flash[:error] = "User does not exist!"
    end
    redirect_to :action => 'start'
  end

end
