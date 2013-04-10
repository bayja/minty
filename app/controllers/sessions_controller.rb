class SessionsController < ApplicationController
  def new
  	@user = User.new
  end

  def create
  	user = User.find_by_name(params[:name])

  	if user and user.authenticate(params[:password])
  		session[:user_id] = user.id
  		redirect_to :root
  	else
      flash[:alert] = "Your password is Invalid"
  		redirect_to login_path 
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to :root
  end
end
