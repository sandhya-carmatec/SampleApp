class ProductImagesController < ApplicationController
before_filter :require_user
  def create
    @product = Product.find(params[:product_id])
    params[:product_image_images].to_a.each do |product_image_image|
      ProductImage.create(:product_image => product_image_image, :product_id => @product.id)
    end
    if @product.save
      flash[:notice] = "Images has been uploaded successfully"
    else
      flash.now[:error] = 'Images upload failed. Please upload again'
    end
    redirect_to edit_product_path(@product)
  end

  def destroy
    @product_image = ProductImage.find(params[:id])
    render :update do |page|
      if  @product_image.destroy
        page << "$('#product_product_image_#{params[:id]}').html('');"
        page.alert("successfully deleted")
      end
    end
  end
end
