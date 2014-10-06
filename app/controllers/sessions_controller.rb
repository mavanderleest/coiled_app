class SessionsController < ApplicationController
  def new
  end

  def create
	  user = User.find_by_email(params[:session][:email])
	  if user && user.authenticate(params[:session][:password])
	    sign_in user
	    flash[:success] = "Logged in!"
	    redirect_to root_path
	  else
	    flash.now.alert = "Invalid email or password"
	    render "new"
	  end
	end

	def destroy
	  sign_out
	  flash[:success] = "Logged out"
	  redirect_to root_path
	end
end