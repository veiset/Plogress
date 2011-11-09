class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authorize

  protected

  def authorize
    unless (session[:user])
      redirect_to :controller => 'login', :action => 'start'
    end
  end
end
