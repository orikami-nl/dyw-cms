module Cms
  class PagesController < Cms::ApplicationController

		before_filter :get_category

		def get_category
			@category = Category.find(params[:category_id])
		end

		def move_page_up
			current_page = @category.pages.find(params[:id])
			upper_page = current_page.previous_page(@category)
			current_position = current_page.position
			upper_position = upper_page.position
			upper_page.update_attributes(:position => 'foo')			
			current_page.update_attributes(:position => upper_position)
			upper_page.update_attributes(:position => current_position)			
			redirect_to category_path(@category)
		end

		def move_page_down
			current_page = @category.pages.find(params[:id])
			lower_page = current_page.next_page(@category)
			current_position = current_page.position
			lower_position = lower_page.position
			lower_page.update_attributes(:position => 'foo')			
			current_page.update_attributes(:position => lower_position)
			lower_page.update_attributes(:position => current_position)			
			redirect_to category_path(@category)
		end

    # GET /pages
    # GET /pages.json
    def index
      @pages = @category.pages.find(:all, :order => 'position')
  
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
      @assets = Asset.all
      respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @page }
      end
    end
  
    # GET /pages/1/edit
    def edit
      @page = Page.find(params[:id])
      @assets = Asset.all
    end
  
    # POST /pages
    # POST /pages.json
    def create
			last_page = @category.pages.find(:all, :order => 'position').last
			if last_page.nil?
				last_position = 0
			else
				last_position = last_page.position.to_i
			end

      @page = @category.pages.create(params[:page])
			@page.position = last_position + 1
  
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
        if @page.update_attributes!(params[:page])
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
