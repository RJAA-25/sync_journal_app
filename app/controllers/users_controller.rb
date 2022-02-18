class UsersController < ApplicationController
  
  before_action :cross_user_restriction, except: [:new, :create]
  before_action :signup_restriction, only: :new

  def index
    @categories = @user.categories
    @tasks = @user.tasks.where(schedule: Date.today)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to index_user_path(username: @user.username)
    else 
      render "users/new"
    end
  end

  def edit
    @user = User.find_by(username: "username")
  end

  def update
    # uncomment before rails test
    @user = User.find_by(username: "username")
    if @user.update(user_params)
      redirect_to index_user_path(username: @user.username)
    else
      render "users/edit"
    end
  end
  
  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :username, :password, :password_confirmation )
  end

  def signup_restriction
    redirect_to index_user_path(username: current_user.username) if logged_in?
  end

end
