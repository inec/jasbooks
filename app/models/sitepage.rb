class Sitepage < ActiveRecord::Base
  attr_accessible :content, :image_url, :maillink, :title
end
