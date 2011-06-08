module Cms
  class Category < ActiveRecord::Base
		has_many :pages, :dependent => :destroy
		validates_presence_of :category_title, :link_name
		validates_uniqueness_of :category_title, :link_name
		validates_format_of :link_name, :with => /^[A-Za-z\d_]+$/
  end
end
