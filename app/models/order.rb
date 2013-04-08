class Order < ActiveRecord::Base
  PAYMENT_TYPES = [ "Check", "Credit card", "Purchase order" ]
  attr_accessible :address, :email, :name, :pay_type, :is_outstanding
  has_many :cart_items, dependent: :destroy
  validates :pay_type, inclusion: PAYMENT_TYPES
  validates :name, :address, :email, presence: true


def add_cart_items_from_cart(cart)
	cart.cart_items.each do |item|
		item.cart_id = nil
		cart_items << item
 	end
end

end
