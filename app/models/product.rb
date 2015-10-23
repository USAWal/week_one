class Product < ActiveRecord::Base
  extend FriendlyId

  friendly_id :title, use: :slugged
  mount_uploaders :pictures, PictureUploader


  has_and_belongs_to_many :categories
  has_and_belongs_to_many :shops
  belongs_to :seller, foreign_key: :user_id, class_name: 'User'

  validates :title, :price, :stock_level, :seller, presence: true
  before_destroy do
    errors.add :shops, 'sell this product' if shops.any?
  end

  accepts_nested_attributes_for :categories, allow_destroy: true
end
