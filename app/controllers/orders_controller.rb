class OrdersController < InheritedResources::Base
   
   before_filter :authenticate_user!

    def index
      @orders=Order.where(:user_id=>current_user.id)
    end
    
    def show
       @order = Order.find(params[:id])
       #@order = order.find(18)
      # redirect_to 
    end

	  def new

    @cart = current_cart
    #@total=@cart.total_price
    #@total=13

    if @cart.cart_items.empty?
      redirect_to book_url, notice: "Your cart is empty"
      return
    end

    @order = Order.new

    @order.email=current_user.email
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @order }
    end
  end

  def create
    @order = Order.new(params[:order])
    @order.add_cart_items_from_cart(current_cart)
    @order.user_id=current_user.id
    @order.subtotal=current_cart.total_price
   
    respond_to do |format|
      if @order.save
        Cart.destroy(session[:cart_id])
        session[:cart_id] = nil
        
        format.html { redirect_to orders_url,notice: "new Order is created"}

      else
        @cart = current_cart
        format.html { render action: "new" }
        format.json { render json: @order.errors,
          status: :unprocessable_entity }
      end
    end
  end




end
