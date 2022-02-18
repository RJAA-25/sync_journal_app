class SessionsController < ApplicationController
	
	before_action :login_restriction, only: :new

	def new;end

	def create
		@user = User.find_by(username: params[:session][:username])
		if @user && @user.authenticate(params[:session][:password])
			session[:user_id] = @user.id
			redirect_to index_user_path(current_user.username)
		else
			render "sessions/new"
		end
	end

	def destroy
		session[:user_id] = nil
		redirect_to root_path
	end

	private
	def login_restriction
		redirect_to index_user_path(current_user.username) if logged_in?
	end
	
end
