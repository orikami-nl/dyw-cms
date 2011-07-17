module Cms
  class Cms::AssetUploader < CarrierWave::Uploader::Base
    if Rails.env.production?
      storage :fog
    else
      storage :file
    end

    def store_dir
      "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
    end

    # Override the directory where uploaded files will be stored.
    # This is a sensible default for uploaders that are meant to be mounted:

  	def cache_dir
  	  "#{Rails.root}/tmp/uploads"
  	end
    
  end
end
