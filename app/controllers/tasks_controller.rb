class TasksController < ApplicationController

  before_action :cross_user_restriction

  def new
    @category = @user.categories.find_by(id: params[:category_id])
    @task = @category.tasks.build
  end

  def create
    @category = @user.categories.find_by(id: params[:category_id])
    @task = @category.tasks.build(task_params)
    if @task.save
      @url_hash[:category_id] = nil
      @url_hash[:task_id] = nil
      redirect_to index_user_path(@url_hash), notice: "Task created successfully"
    else
      render "tasks/new"
    end
  end

  def edit
    @task = Task.find_by(id: params[:task_id])
  end

  def update
    @task = Task.find_by(id: params[:task_id])
    if @task.update(task_params)
      @url_hash[:category_id] = nil
      @url_hash[:task_id] = nil
      redirect_to index_user_path(@url_hash)
    else
      render "tasks/new"
    end
  end

  def destroy
    @task = Task.find_by(id: params[:task_id])
    @task.destroy
    @url_hash[:category_id] = nil
    @url_hash[:task_id] = nil
    redirect_to index_user_path(@url_hash)
  end

  private
  def task_params
    params.require(:task).permit(:details, :schedule)
  end
end