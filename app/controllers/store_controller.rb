class StoreController < ApplicationController
  def index


  	     @books = Book.order("id").page(params[:page]).per(3)


  end

    def search
  end # Loads up the search.html.erb view file.
  
  def search_results
    @keyword = params[:keyword]
    
    @books = Book.where("title LIKE ? or Description like ?", "%#{@keyword}%","%#{@keyword}%")
  end
end
