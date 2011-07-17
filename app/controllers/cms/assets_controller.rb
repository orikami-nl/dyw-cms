module Cms
  class AssetsController < Cms::ApplicationController
    def index
      @assets = Asset.all
    end
    def new
      @asset = Asset.new
    end
    
    def edit
       @asset = Asset.find(params[:id])
    end
        
    def create  
      @asset = Asset.new(params[:asset])  
      if @asset.save
        redirect_to action: :index
      else
        render action: :new
      end
    end
    
    def destroy
      @asset = Asset.find(params[:id])
      @asset.destroy
      redirect_to assets_path
    end
    
  end
end