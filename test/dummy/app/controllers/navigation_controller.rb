class NavigationController < ApplicationController
  def show_page
    @page = Cms::Page.find_by_link_name(params[:page_title])
    respond_to do |format|
      format.html { render :show}
      format.json { render :json => @page }
    end
  end

  def show_category
    @category = Cms::Category.find_by_link_name(params[:category_title])
    respond_to do |format|
      format.html { render :show}
      format.json { render :json => @category }
    end
  end

end
