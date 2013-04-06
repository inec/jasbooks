class Cart < ActiveRecord::Base
  # attr_accessible :title, :body
  has_many :cart_items, :dependent => :destroy


  def add_book(book_id)
		current_item = cart_items.where(:book_id => book_id).first
		if current_item
			current_item.quantity += 1
		else
			current_item = cart_items.build(:book_id => book_id)
		end
		current_item
	end
end
