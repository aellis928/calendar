class CalendarsController < ApplicationController
  def index
  	@user = User.find(params[:id])
  end

  def logout
  	session[:user_id] = nil
	redirect_to '/users/login'
  end
end
