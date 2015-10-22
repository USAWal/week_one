class Product < ActiveRecord::Base
  mount_uploaders :pictures, PictureUploader

  has_and_belongs_to_many :categories
  belongs_to :seller, foreign_key: :user_id, class_name: 'User'

  validates :title, :price, :stock_level, :seller, presence: true
end
