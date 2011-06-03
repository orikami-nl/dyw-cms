class NavigationController < ApplicationController
  def show
    @page = Cms::Page.find_by_link_url(params[:title])
    respond_to do |format|
      format.html { render :show}
      format.json { render :json => @page }
    end
  end

end
