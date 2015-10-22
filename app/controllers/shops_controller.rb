class ShopsController < ApplicationController
  def index
    @shops = Shop.page(params[:page]).per(params[:per])
  end
end
