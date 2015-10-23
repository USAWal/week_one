class ShopsController < ApplicationController
  def index
    @shops = Shop.page(params[:page]).per(params[:per])
  end

  def show
    @shop = Shop.friendly.find params[:id]
  end
end
