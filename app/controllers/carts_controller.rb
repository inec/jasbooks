class CartsController < InheritedResources::Base
	def add_book
		
	end


    def index
      @cart = Cart.find(session[:cart_id])
    end 

    
      def show
    @cart = Cart.find(session[:cart_id])

    respond_to do |format|
      format.html # show.html.erb

    end
  end


end
