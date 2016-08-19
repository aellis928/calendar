class UsersController < ApplicationController
  	def index
  	end

  	def create
	@user= User.new(user_params)
		if @user.save
			session[:user_id] = @user.id
			redirect_to "/calendars/#{session[:user_id]}"
		else
			flash[:errors] = @user.errors.full_messages
			redirect_to "/users/register"
		end
	end

	def register
	end

	def login
	end

	def signIn
		user = User.find_by_email(params[:email])
			puts ""
		if user && user.authenticate(params[:password]) 
			puts "yay i did it correctly!"
			session[:user_id] = user.id
			redirect_to "/calendars/#{user.id}"
		else
			flash[:errors]= ['Invalid Combination']
			redirect_to '/users/login'
		end
	end

	def show
		@user = User.find(params[:id])
	end



  




  private 
  def user_params
  	params.require(:user).permit(:first_name, :last_name, :location, :email, :password, :password_confirmation)
  end
end
