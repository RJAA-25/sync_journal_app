class CategoriesController < ApplicationController

  def new
    @category = User.find_by(username: params[:username]).categories.build
  end

  def create
    # @category = Category.new(category_params)
    @category = User.find_by(username: params[:username]).categories.build(category_params)
    if @category.save
      redirect_to index_user_path(username: "username")
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
      redirect_to index_user_path(username: "username")
    else
      render "categories/edit"
    end
  end

  private
  def category_params
    params.require(:category).permit(:title, :description)
  end
end
