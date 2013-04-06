load 'ar.rb'

a_cart=Book.first

puts a_cart.inspect

lintem=a_cart.cart_items.build

puts lintem.inspect