class Cart < ActiveRecord::Base
   attr_accessible :user_id
  has_many :cart_items, :dependent => :destroy
  belongs_to :user

  def add_book(book_id)
		current_item = cart_items.where(:book_id => book_id).first
		if current_item
			current_item.quantity += 1
		else
			current_item = cart_items.build(:book_id => book_id)
		end
		current_item
	end

	def total_price
      cart_items.to_a.sum { |item| item.total_price }
    end
	
	def name 
      self.id
	
	end
end
