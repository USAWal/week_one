class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :set_cart

  private

  def set_cart
    @cart ||= if current_user.try :cart
      current_user.cart
    elsif session[:cart_id]
      Cart.find_by(id: session[:cart_id]) || Cart.create
    else
      Cart.create
    end
    @cart.update! user: current_user if current_user && current_user.cart.nil?
    session[:cart_id] = @cart.id
  end
end
