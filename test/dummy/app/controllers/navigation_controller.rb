class NavigationController < ApplicationController
	
	before_filter :get_category

	def get_category
		#@category = Cms::Category.find_by_link_name(params[:category_title])
		@category = Cms::Category.find_by_link_name(params[:category_title])
	end

  def show_page
    @page = Cms::Page.find(params[:page_title])
		@pages = @category.pages.all
    respond_to do |format|
      format.html { render :show_page}
      format.json { render :json => @page }
    end
  end

  def show_category
		@pages = @category.pages.all
    respond_to do |format|
      format.html { render :show_category}
      format.json { render :json => @category }
    end
  end

end
