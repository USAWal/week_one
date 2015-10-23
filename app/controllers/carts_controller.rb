class CartsController < ApplicationController
  def show
  end

  def add
    cart_params = params.require(:item).permit(:product_id, :count)
    product = Product.find cart_params[:product_id]
    count = cart_params[:count].to_i
    count = product.stock_level > count ? count : product.stock_level
    item = @cart.items.find_or_initialize_by product_id: product.id
    item.update! count: count
    flash[:notice] = 'Product successfully added'
    redirect_to :back
  end

  def order
  end

  def delete
    @cart.items.find(params[:item_id]).destroy!
    flash[:notice] = 'Product successfully deleted'
    redirect_to :back
  end
end
