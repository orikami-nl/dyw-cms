module Cms
  class Page < ActiveRecord::Base
		belongs_to :category
		validates_presence_of :page_title, :link_name
		validates_uniqueness_of :page_title, :link_name
  end
end
