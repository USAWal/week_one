class OrderItem < ActiveRecord::Base
  belongs_to :order, inverse_of: :items
  belongs_to :product

  validates :order, :product, :count, presence: true

  before_create :decrease_stock_level

  private

  def decrease_stock_level
    product.decrement :stock_level, count
  end
end
