class Cart < ActiveRecord::Base
  belongs_to :user, inverse_of: :cart
end
