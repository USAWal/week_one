class CartItem < ActiveRecord::Base
  belongs_to :cart, inverse_of: :items
  belongs_to :product

  validates :cart, :product, :count, presence: true
end
