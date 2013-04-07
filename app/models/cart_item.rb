class CartItem < ActiveRecord::Base
  attr_accessible :book_id, :cart_id
  belongs_to :book
  belongs_to :cart
  belongs_to :order


  def total_price
	book.list_price*quantity
	end
end
