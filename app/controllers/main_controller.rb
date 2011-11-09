class MainController < ApplicationController
  def view
    if(session[:user].nil?)
      redirect_to :controller => 'login', :action => 'start'
    end
  end
end
