module Cms
  class Page < ActiveRecord::Base

  		serialize :page_title
  		serialize :body

		belongs_to :category
		attr_accessible :page_title, :link_name, :position, :body, :locales
		validates_presence_of :page_title, :link_name
		validates_format_of :link_name, :with => /^[A-Za-z\d_]+$/


		def previous_page(category)
			self.class.first(:conditions => ["position < ? and category_id = ?", position, category.id], :order => "position desc")
		end

		def next_page(category)
		  self.class.first(:conditions => ["position > ? and category_id = ?", position, category.id], :order => "position asc")
		end

  end
end
