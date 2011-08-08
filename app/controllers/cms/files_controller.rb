module Cms
  class FilesController < Cms::ApplicationController
    def index
      @assets = File.all
    end
    def new
      @asset = File.new
    end
    
    def edit
       @asset = File.find(params[:id])
    end
        
    def create  
      @asset = File.new(params[:file])  
      if @asset.save
	  		Rails.cache.clear
        redirect_to session[:last_visited], notice: 'File was successfully uploaded.'
      else
        render action: :new
      end
    end
	
		def show
      redirect_to session[:last_visited]
		end
    
    def destroy
      @asset = File.find(params[:id])
      @asset.destroy
  		Rails.cache.clear
      redirect_to session[:last_visited]
    end

		def update
			@asset = File.find(params[:id])
			  
      respond_to do |format|
        if @asset.update_attributes(params[:file])
		  		Rails.cache.clear
          format.html { redirect_to session[:last_visited], notice: 'File was successfully updated.' }
          format.json { head :ok }
        else
          format.html { render action: "edit" }
          format.json { render json: @category.errors, status: :unprocessable_entity }
        end
      end
    end

  end
end
