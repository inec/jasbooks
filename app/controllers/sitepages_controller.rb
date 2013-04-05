class SitepagesController < InheritedResources::Base
	  def show
    @book = Sitepag.find(1)

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @book }
    end
  end
end
