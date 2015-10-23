class ProductsController < ApplicationController
  before_action :set_product,    only: [:show]
  before_action :set_my_product, only: [:edit, :update, :destroy]

  def show
    @product = Product.friendly.find params[:id]
  end

  def index
    @products = @current_user.products
  end

  def new
    @product = @current_user.products.build
  end

  def create
    @product = @current_user.products.build product_params
    if @product.save
      redirect_to action: :index
    else
      flash[:alert] = @product.errors.full_messages.join ', '
      render :new
    end
  end

  def edit
  end

  def update
    if @product.update_attributes product_params
      redirect_to action: :show
    else
      flash[:alert] = @product.errors.full_messages.join ', '
      render :edit
    end
  end

  def destroy
    if @product.seller == current_user && @product.destroy
      redirect_to action: :index
    else
      flash[:alert] = @product.errors.full_messages.join ', '
      render :show
    end
  end

  private

  def set_product
    @product = Product.friendly.find params[:id]
  end

  def set_my_product
    @product = @current_user.products.friendly.find params[:id]
  end

  def product_params
    params.require(:product).permit(:title, :description, :price, :stock_level, { pictures: [] })
  end
end
