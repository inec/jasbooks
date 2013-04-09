class StoreController < ApplicationController
  def index


  	     @books = Book.order("id").page(params[:page]).per(3)


  end
end
