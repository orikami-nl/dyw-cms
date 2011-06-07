module Cms
  class Page < ActiveRecord::Base
		validates_presence_of :title, :link_name
		validates_uniqueness_of :title, :link_name
  end
end
