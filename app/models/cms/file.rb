module Cms
  class File < ActiveRecord::Base
    mount_uploader :file, AssetUploader
  end
end
