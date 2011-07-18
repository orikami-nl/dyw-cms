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
        redirect_to action: :index
      else
        render action: :new
      end
    end
    
    def destroy
      @asset = File.find(params[:id])
      @asset.destroy
      redirect_to files_path
    end
    
  end
end