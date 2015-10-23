class Order < ActiveRecord::Base
  belongs_to :seller, class_name: 'User', inverse_of: :serving_orders
  belongs_to :client, class_name: 'User', inverse_of: :my_orders
  has_many :items, class_name: 'OrderItem', validate: true
end
