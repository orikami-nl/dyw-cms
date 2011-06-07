module Cms
  class Category < ActiveRecord::Base
		has_many :pages
		validates_presence_of :title, :link_name
		validates_uniqueness_of :title, :link_name
  end
end
