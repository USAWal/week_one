class ShopsController < ApplicationController
  before_action :set_my_shop, only: [:edit, :update, :destroy]

  def index
    user_id = params[:user_id]
    @shops = (user_id.blank? ? Shop : User.find(user_id).shops).page(params[:page]).per(params[:per])
  end

  def create
    @shop = @current_user.shops.build shop_params
    if @shop.save
      redirect_to action: :index
    else
      flash[:alert] = @shop.errors.full_messages.join ', '
      render :new
    end
  end

  def show
    @shop = Shop.friendly.find params[:id]
  end

  def new
    @shop = current_user.shops.new
  end

  def edit
  end

  def update
    if @shop.update_attributes shop_params
      redirect_to action: :show
    else
      flash[:alert] = @shop.errors.full_messages.join ', '
      render :edit
    end
  end

  def destroy
    if @shop.owner == current_user && @shop.destroy
      redirect_to action: :index
    else
      flash[:alert] = @shop.errors.full_messages.join ', '
      render :show
    end
  end

  private

  def set_my_shop
    @shop = @current_user.shops.friendly.find params[:id]
  end

  def shop_params
    params.require(:shop).permit(:name, :description, :logo)
  end
end
