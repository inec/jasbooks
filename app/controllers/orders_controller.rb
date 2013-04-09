class OrdersController < InheritedResources::Base

	  def new
    @cart = current_cart
    if @cart.cart_items.empty?
      redirect_to book_url, notice: "Your cart is empty"
      return
    end

    @order = Order.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @order }
    end
  end

  def create
    @order = Order.new(params[:order])
    @order.add_cart_items_from_cart(current_cart)


    respond_to do |format|
      if @order.save
        Cart.destroy(session[:cart_id])
        session[:cart_id] = nil

        format.html { redirect_to root_url }

      else
        @cart = current_cart
        format.html { render action: "new" }
        format.json { render json: @order.errors,
          status: :unprocessable_entity }
      end
    end
  end




end
