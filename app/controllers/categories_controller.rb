class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(params[:category])
    if @category.save
      flash[:notice] = "category has been saved"
      redirect_to category_path(@category)
    else
      flash[:error] = "Error whole creating category, plz try again"
      render :action => "new"
    end
  end

  def show
    @category = Category.find(params[:id])
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @category.update_attributes(params[:category])
      flash[:notice] = "Successfully updated"
      redirect_to category_path(@category)
    else
      flash[:error] = "error while updating category"
      render :action => "edit"
    end
  end

  def destroy
    @category = Category.find(params[:id])
    if @category.destroy
      flash[:notice] = "Successfully deleted"
      redirect_to categories_path
    else
      flash[:error] = "Error whole deleting category, plz try again"
      redirect_to categories_path
    end
  end

end
