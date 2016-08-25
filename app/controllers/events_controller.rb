class EventsController < ApplicationController
  def index
  	@user = User.find(params[:id])
  	time =Time.new
  	@time = time.strftime("%A")
  	@time_date = time.strftime("%B %d")
    @events = @user.events
    

    # so right now I need to figure out how to access the hour of each event? possibly using the above code or a variation of it.  Know that front-end wise, it will be looping through all the posted events of that particular user

    # might be a good idea to reset the database? 

    # once that is done, i can tackle changing the background color of the hour, but i think the best way to do that is just the inline style... but idk we will see!



  end

  def create 
    # puts params['name']
    # puts params['description']
    # puts params['location']
    # puts params['date']
    # puts params['time']
    # puts params['color']
    # puts params['notify']
    # puts params['user_id']
    @user = User.find(params['user_id'])
    @event = Event.new( event_params )
    
    if @event.save
      CalendarMailer.event_email(@user).deliver
      redirect_to("/events/#{session[:user_id]}")
    else
      flash[:errors] = @event.errors.full_messages
      redirect_to("/events/#{session[:user_id]}")
    end
  end

  def update
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to("events/#{session[:user_id]}")
  end

  def logout
  	session[:user_id] = nil
	redirect_to '/'
  end



  private
    def event_params
      params.require(:event).permit(:user_id, :name, :description, :location, :date, :time, :color, :notify)
    end
end
