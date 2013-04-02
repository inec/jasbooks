class Book < ActiveRecord::Base
  attr_accessible :description, :image_url, :list_price, :title
end
