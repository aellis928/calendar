class EventsController < ApplicationController
  def index
  	@user = User.find(params[:id])
  	
  	time =Time.new
  	@time = time.strftime("%A")
  	@time_date = time.strftime("%B %d")
  end

  def create
  	# Event.create(content: params['secret'], user: User.find(params['user_id']))
  	puts params['notify']
  	puts params['time']
  	puts params['date']
  	puts params['color']

 
  end

  def update
  end

  def delete
  end

  def logout
  	session[:user_id] = nil
	redirect_to '/users/login'
  end
end
