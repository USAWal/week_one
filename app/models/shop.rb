class Shop < ActiveRecord::Base
  belongs_to :owner, class_name: 'User', foreign_key: :user_id
  has_and_belongs_to_many :products
  has_many :categories, -> { uniq }, through: :products

  validates :owner, presence: true
end
