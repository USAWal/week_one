class CategoriesController < ApplicationController
  def show
    @shop = Shop.friendly.find params[:shop_id]
    @category = @shop.categories.friendly.find params[:id]
  end
end
