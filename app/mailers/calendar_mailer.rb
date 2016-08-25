class CalendarMailer < ActionMailer::Base
  default from: "msellis.214@gmail.com"

  def event_email(user)
    @user = user
    mail(to: @user.email, subject: 'Event Reminder')
  end
end