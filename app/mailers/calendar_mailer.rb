class CalendarMailer < ActionMailer::Base
  default from: "msellis.214@gmail.com"

  def event_email(user, event)
    @user = user
    @event = event
    mail(to: @user.email, subject: 'Event Reminder')
  end
end