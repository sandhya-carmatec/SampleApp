class ProductsController < ApplicationController
  before_filter :require_user
  def index
    per_page = params[:per_page] || 10
    @products = Product.paginate(:page => params[:page], :per_page => per_page)
  end

  def new
    @product = Product.new
    3.times { @product.product_images.build }
  end

  def create
    @product = Product.new(params[:product])
    if @product.save
      flash[:notice] = "product was sucessfully created"
      redirect_to product_path(@product)
    else
      flash[:error] = "Error while creating product plz try again"
      render :action => "new"
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update_attributes(params[:product])
      flash[:notice] = "Successfully updated"
      redirect_to product_path(@product)
    else
      flash[:error] = "Error while updating plz try again"
      render :action => "edit"
    end
  end

  def destroy
    @product = Product.find(params[:id])
    if @product.destroy
      redirect_to products_path
      flash[:notice] = "Deleted Succesfully"
    end
  end
end
