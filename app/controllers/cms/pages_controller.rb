module Cms
  class PagesController < Cms::ApplicationController

		before_filter :get_category

		def get_category
			@category = Category.find(params[:category_id])
		end

    # GET /pages
    # GET /pages.json
    def index
      @pages = @category.pages.all
  
      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @pages }
      end
    end
  
    # GET /pages/1
    # GET /pages/1.json
    def show
      @page = @category.pages.find(params[:id])
  
      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @page }
      end
    end
    
    def showbylinkname
      @page = Category.pages.find_by_link_name(params[:page_title])
      respond_to do |format|
        format.html { render :show}
        format.json { render :json => @page }
      end
    end
    
    # GET /pages/new
    # GET /pages/new.json
    def new
      @page = @category.pages.new
      respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @page }
      end
    end
  
    # GET /pages/1/edit
    def edit
      @page = Page.find(params[:id])
    end
  
    # POST /pages
    # POST /pages.json
    def create
      @page = @category.pages.create(params[:page])
  
      respond_to do |format|
        if @page.save
          format.html { redirect_to category_path(@category), notice: 'Page was successfully created.' }
          format.json { render json: @page, status: :created, location: @page }
        else
          format.html { render action: "new" }
          format.json { render json: @page.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # PUT /pages/1
    # PUT /pages/1.json
    def update
      @page = Page.find(params[:id])
  
      respond_to do |format|
        if @page.update_attributes(params[:page])
          format.html { redirect_to category_path(@category), notice: 'Page was successfully updated.' }
          format.json { head :ok }
        else
          format.html { render action: "edit" }
          format.json { render json: @page.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # DELETE /pages/1
    # DELETE /pages/1.json
    def destroy
      @page = Page.find(params[:id])
      @page.destroy
  
      respond_to do |format|
        format.html { redirect_to category_path(@category) }
        format.json { head :ok }
      end
    end
  end
end
