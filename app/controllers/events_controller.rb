class EventsController < ApplicationController
  def index
  	@user = User.find(params[:id])
  	time =Time.new
  	@time = time.strftime("%A")
  	@time_date = time.strftime("%B %d")
    @date = time.strftime("%Y-%m-%d")
    @events = @user.events
  end

  def create 
    @user = User.find(params['user_id'])
    @event = Event.new( event_params )

    if @event.save
      if !@event.notify
        redirect_to("/events/#{session[:user_id]}")
      else
        CalendarMailer.event_email(@user, @event).deliver
        o09-]\
      redirect_to("/events/#{session[:user_id]}")
      end
    else
      flash[:errors] = @event.errors.full_messages
      redirect_to("/events/#{session[:user_id]}")
    end
  end

  def update
  end

  def destroy
    @user = User.find(params['user_id'])  
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to("/events/#{session[:user_id]}")
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


# maybe some javascript to show details of each of the event?  

# then its just overall styling of the websight! woohoo! Then all done!
