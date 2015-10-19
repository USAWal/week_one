class Product < ActiveRecord::Base
  has_and_belongs_to_many :categories

  validates :title, :price, :stock_level, presence: true
end
