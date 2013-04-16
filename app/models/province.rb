class Province < ActiveRecord::Base
  attr_accessible :gst, :hst, :name, :pst
   has_many :orders


   def total_tax_rate
   	self.gst+self.pst+self.hst
   end
end
