class CartItemsController < InheritedResources::Base
	before_filter :authenticate_user!,	 :notice => 'New user was created!'
	def create
	@cart = current_cart
	#book = Book.find((params[:book_id])
	#@cart_item = @cart.cart_items.build(:book_id => params[:book_id])
	@cart_item = @cart.add_book(params[:book_id])
	@cart.user_id=current_user.id
    @cart.save
  respond_to do |format|
		if @cart_item.save
		format.html { redirect_to(@cart_item.cart,:notice => 'Line item was successfully created.') }

			else
			format.html { render :action => "new" }

			end
		end
	end



	def index
    @cart_items = CartItem.all

    respond_to do |format|
      format.html # index.html.erb
     
    	end
  	end


   def show
    @cart_item = CartItem.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      
    end
  end
end
