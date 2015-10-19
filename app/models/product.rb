class Product < ActiveRecord::Base
  validates :title, :price, :stock_level, presence: true
end
