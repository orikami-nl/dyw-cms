module Cms
  class File < ActiveRecord::Base
		attr_accessible :name, :file
		validates_presence_of :name, :file

    mount_uploader :file, AssetUploader
  end
end
