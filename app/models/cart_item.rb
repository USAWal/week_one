class CartItem < ActiveRecord::Base
  belongs_to :cart, inverse_of: :items
  belongs_to :product

  validates :cart, :product, :count, presence: true
  validate  :count_less_than_stock_level

  private

  def count_less_than_stock_level
    errors.add :count, "should be less than or equal to #{product.stock_level}" if product.stock_level < count
  end
end
