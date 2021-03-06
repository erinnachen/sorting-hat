class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(username: params[:session][:username])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      if current_user.admin?
        redirect_to admin_dashboard_path
      else
        redirect_to user_path(user.id)
      end
    else
      flash.now[:error] = "Unable to login, please try again."
      render :new
    end
  end

  def destroy
    session.clear
    flash[:notice] = "You have successfully logged out"
    redirect_to root_path
  end
end
