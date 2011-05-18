module Cms
  class Page < ActiveRecord::Base
		validates_presence_of :title, :link_url
		validates_uniqueness_of :title, :link_url
  end
end
