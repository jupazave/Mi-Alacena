class Product < ActiveRecord::Base

	has_many :cart_items
  has_many :carts, :through => :cart_items
end
