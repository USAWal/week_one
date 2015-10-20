class Product < ActiveRecord::Base
  mount_uploaders :pictures, PictureUploader

  has_and_belongs_to_many :categories

  validates :title, :price, :stock_level, presence: true
end
