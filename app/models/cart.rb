class Cart < ActiveRecord::Base
  belongs_to :user, inverse_of: :cart
  has_many   :items, class_name: 'CartItem'
end
