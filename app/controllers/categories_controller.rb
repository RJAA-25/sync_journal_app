class CategoriesController < ApplicationController

  before_action :cross_user_restriction

  def new
    @category = @user.categories.build
  end

  def create
    @category = @user.categories.build(category_params)
    if @category.save
      @url_hash[:category_id] = nil
      @url_hash[:task_id] = nil
      redirect_to index_user_path(@url_hash), notice: "Category created successfully"
    else
      render "categories/new"
    end
  end

  def edit
    @category = Category.find_by(id: params[:category_id])
  end

  def update
    @category = Category.find_by(id: params[:category_id])
    if @category.update(category_params)
      @url_hash[:category_id] = nil
      @url_hash[:task_id] = nil
      redirect_to index_user_path(@url_hash)
    else
      render "categories/edit"
    end
  end

  def destroy
    @category = Category.find_by(id: params[:category_id])
    @category.destroy
    @url_hash[:category_id] = nil
    @url_hash[:task_id] = nil
    redirect_to index_user_path(@url_hash)
  end

  private
  def category_params
    params.require(:category).permit(:title, :description)
  end
end
