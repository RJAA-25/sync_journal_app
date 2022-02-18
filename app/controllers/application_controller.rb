class ApplicationController < ActionController::Base

  helper_method :current_user, :logged_in?
	# :cross_user_restriction

	def current_user
		User.find_by(id: session[:user_id])
	end

	def logged_in?
		!current_user.nil?
	end
	
	def cross_user_restriction
		@user = User.find_by(username: params[:username])
		if logged_in?
		  if @user != current_user
				redirect_to index_user_path(username: current_user.username)
			else 
				@url_hash = { username: params[:username], category_id: params[:category_id], task_id: params[:task_id] }
			end
		else
		  redirect_to login_path
		end
	end

end
