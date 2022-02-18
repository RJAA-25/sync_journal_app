class UsersController < ApplicationController

  def index
  end

  def new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to index_user_path(username: "username")
    else 
      render "users/new"
    end
  end

  def edit
  end

  def update
    @user = User.find_by(username: "username")
    if @user.update(user_params)
      redirect_to index_user_path(username: "username")
    else
      render "users/edit"
    end
  end
  
  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :username, :password, :password_confirmation )
  end
end
