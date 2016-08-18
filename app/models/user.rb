class User < ActiveRecord::Base
	has_secure_password
  	email_regex = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  	validates :first_name, :last_name,  :presence => true
  	validates :email, confirmation: true, :uniqueness => true, :format => { :with => email_regex }
end
