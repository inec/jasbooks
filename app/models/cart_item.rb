class CartItem < ActiveRecord::Base
  attr_accessible :book_id, :cart_id
  belong_to:book_id
  belong_to:cart
end
