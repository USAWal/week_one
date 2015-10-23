class CategoriesController < ApplicationController
  def show
    @shop = Shop.friendly.find params[:shop_id]
    @category = @shop.categories.friendly.find params[:id]
  end

  def create
    Product.friendly.find(params[:product_id]).categories.create params.require(:category).permit(:title)
    redirect_to :back
  end
end
