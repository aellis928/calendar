class User < ActiveRecord::Base
	has_many :events, dependent: :destroy
	has_secure_password
  	email_regex = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  	validates :first_name, :last_name,  :presence => true
  	validates :email, confirmation: true, :uniqueness => true, :format => { :with => email_regex }
end


# so what I still need to do is make sure that the things that I enter into the database will appear on my front end.  Make sure that things are even saving in the backend because Im not too sure that they are.

# nothing is saving to the database.. need to figure out why. but validations are working beautifully! maybe look into how to get custom validations?

#last but not lease, get the color that is pasted to the backend, get it to be able to be the background color for each time in the front end! 

#hopefully finish this tomorrow or monday! woohoo!