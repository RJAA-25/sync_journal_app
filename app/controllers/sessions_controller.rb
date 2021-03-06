class SessionsController < ApplicationController
	
	before_action :login_restriction, only: :new

	def new;end

	def create
		@user = User.find_by(username: params[:session][:username])
		if @user && @user.authenticate(params[:session][:password])
			session[:user_id] = @user.id
			redirect_to index_user_path(current_user.username), notice: "Logged in successfully"
		else
			flash.now[:alert] = "Invalid login credentials"
			render "sessions/new"
		end
	end

	def destroy
		session[:user_id] = nil
		redirect_to root_path, notice: "Signed out successfully" 
	end

	private
	def login_restriction
		redirect_to index_user_path(current_user.username)if logged_in?
	end
	
end
