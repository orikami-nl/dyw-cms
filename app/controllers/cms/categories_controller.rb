module Cms
  class CategoriesController < ApplicationController
		def move_category_up
			current_category = Category.find(params[:id])
			upper_category = current_category.previous_category
			current_position = current_category.position
			upper_position = upper_category.position
			upper_category.update_attributes(:position => 'foo')			
			current_category.update_attributes(:position => upper_position)
			upper_category.update_attributes(:position => current_position)			
			redirect_to root_path
		end

		def move_category_down
			current_category = Category.find(params[:id])
			lower_category = current_category.next_category
			current_position = current_category.position
			lower_position = lower_category.position
			lower_category.update_attributes(:position => 'foo')			
			current_category.update_attributes(:position => lower_position)
			lower_category.update_attributes(:position => current_position)			
			redirect_to root_path
		end

    # GET /categories
    # GET /categories.json
    def index
      @categories = Category.find(:all, :order => 'position')
  
      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @categories }
      end
    end
  
    # GET /categories/1
    # GET /categories/1.json
    def show
      @category = Category.find(params[:id])
  		@pages = @category.pages.find(:all, :order => 'position')

      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @category }
      end
    end
  
    # GET /categories/new
    # GET /categories/new.json
    def new
      @category = Category.new
  
      respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @category }
      end
    end
  
    # GET /categories/1/edit
    def edit
      @category = Category.find(params[:id])
      @assets = Cms::File.all
			session[:last_visited] = edit_category_path(@category)
    end
  
    # POST /categories
    # POST /categories.json
    def create
			last_category = Category.find(:all, :order => 'position').last
			if last_category.nil?
				last_position = 0
			else
				last_position = last_category.position.to_i
			end

      @category = Category.new(params[:category])
			@category.position = last_position + 1
  
      respond_to do |format|
        if @category.save
          format.html { redirect_to @category, notice: 'Category was successfully created.' }
          format.json { render json: @category, status: :created, location: @category }
        else
          format.html { render action: "new" }
          format.json { render json: @category.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # PUT /categories/1
    # PUT /categories/1.json
    def update
      @category = Category.find(params[:id])
  
      respond_to do |format|
        if @category.update_attributes(params[:category])
          format.html { redirect_to @category, notice: 'Category was successfully updated.' }
          format.json { head :ok }
        else
          format.html { render action: "edit" }
          format.json { render json: @category.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # DELETE /categories/1
    # DELETE /categories/1.json
    def destroy
      @category = Category.find(params[:id])
      @category.destroy
  
      respond_to do |format|
        format.html { redirect_to categories_url }
        format.json { head :ok }
      end
    end
  end
end
