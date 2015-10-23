class OrdersController < ApplicationController
  def index
    @type  = params[:type] || 'my'
    @orders = @type == 'serving' ? current_user.serving_orders : current_user.my_orders
  end

  def create
    if @cart.valid?
      @cart.items.includes(:product).group_by { |item| item.product.seller }.each do |seller, items|
        order = Order.new seller: seller, client: current_user
        items.each do |item|
          order.items.build product: item.product, count: item.count
        end
        order.save && CartItem.where(id: items.map(&:id)).destroy_all
      end
    end

    redirect_to action: :index
  end
end
