class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :add_stat

  def add_stat
  	Stat.add(request)
  end

  def current_user
  	if session[:user_id]
	  	@current_user ||= User.find(session[:user_id])
	 end
  end

  helper_method :current_user
end
