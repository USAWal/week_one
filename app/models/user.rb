class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

  has_one  :cart,     inverse_of: :user,   dependent: :nullify
  has_many :products, inverse_of: :seller, dependent: :destroy
  has_many :shops,    inverse_of: :owner,  dependent: :restrict_with_error
end
