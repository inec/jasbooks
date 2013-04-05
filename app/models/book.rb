class Book < ActiveRecord::Base
  attr_accessible :description, :image_url, :list_price, :title, :category_id
  
  has_many :cart_items
  belongs_to :category

end
