class CartsController < ApplicationController
  def show
  end

  def add
    cart_params = params.require(:item).permit(:product_id, :count)
    product = Product.find cart_params[:product_id]
    count = cart_params[:count].to_i
    item = @cart.items.find_or_initialize_by product_id: product.id
    item.count = count
    if item.save
      flash[:notice] = 'Product successfully added'
    else
      flash[:alert] = item.errors.full_messages.join ', '
    end
    redirect_to :back
  end

  def delete
    @cart.items.find(params[:item_id]).destroy!
    flash[:notice] = 'Product successfully deleted'
    redirect_to :back
  end
end
