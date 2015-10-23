class Shop < ActiveRecord::Base
  extend FriendlyId
  paginates_per 10

  friendly_id :name, use: :slugged

  mount_uploader :logo, LogoUploader

  belongs_to :owner, class_name: 'User', foreign_key: :user_id
  has_and_belongs_to_many :products
  has_many :categories, -> { uniq }, through: :products

  validates :name, :owner, presence: true
  validates :name, uniqueness: true
end
