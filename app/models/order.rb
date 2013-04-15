class Order < ActiveRecord::Base
  PAYMENT_TYPES = [ "Check", "Credit card", "Purchase order" ]
  attr_accessible :address, :email, :name, :pay_type, :is_outstanding, :user_id, :subtotal
  has_many :cart_items, dependent: :destroy
  belongs_to :user
  validates :pay_type, inclusion: PAYMENT_TYPES
  validates :name, :address, :email, presence: true


def add_cart_items_from_cart(cart)
	cart.cart_items.each do |item|
		item.cart_id = nil
		cart_items << item
 	end
end

def paypal_urlid(order_id)
#def paypal_urlid(return_url)
     the_order=Order.find(order_id)
    values = {
      :business => 'luyege-facilitator@gmail.com',
      :cmd => '_cart',
      :upload => 1,
      :return => "http://localhost/orders/#{order_id}",
      :invoice => id
    }
    
      values.merge!({
       "amount_1" => 10,
       "item_name_1" => the_order.subtotal,
       "item_number_1" => 1,
       "quantity_1" => 1
      })
    
    "https://www.sandbox.paypal.com/cgi-bin/webscr?" + values.to_query
  end
def paypal_url(return_url)
     the_order=Order.find(return_url.split('/')[-1])
    values = {
      :business => 'luyege-facilitator@gmail.com',
      :cmd => '_cart',
      :upload => 1,
      :return => return_url,
      :invoice => id
    }
    the_order.is_outstanding=false
    the_order.save
      values.merge!({
       "amount_1" => the_order.subtotal,
       "item_name_1" => "Jasbook order #{the_order.id}",
       "item_number_1" => 1,
       "quantity_1" => 1
      })
    
    "https://www.sandbox.paypal.com/cgi-bin/webscr?" + values.to_query


  end

end
