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

  def order
    if @cart.valid?
      @cart.items.includes(:product).group_by { |item| item.product.seller }.each do |seller, items|
        order = Order.new seller: seller, client: current_user
        items.each do |item|
          order.items.build product: item.product, count: item.count
        end
        order.save && CartItem.where(id: items.map(&:id)).destroy_all
      end
    end
  end

  def delete
    @cart.items.find(params[:item_id]).destroy!
    flash[:notice] = 'Product successfully deleted'
    redirect_to :back
  end
end
