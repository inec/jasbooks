class CartsController < InheritedResources::Base
	def add_book
		
	end


    def index
      @cart = Cart.find(session[:cart_id])
     rescue ActiveRecord::RecordNotFound

    redirect_to root_url, :notice => 'Invalid cart'

    end 

    
      def show
    @cart = Cart.find(session[:cart_id])


    respond_to do |format|
      format.html # show.html.erb

    end
  end

  def destroy
    @cart = current_cart
    @cart.destroy
    session[:cart_id] = nil

    respond_to do |format|
      format.html { redirect_to root_url , :notice => 'Your cart is empty'}
      format.json { head :no_content }
    end
  end


end
