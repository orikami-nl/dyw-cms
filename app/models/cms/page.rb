module Cms
  class Page < ActiveRecord::Base
		validates_presence_of :title, :link_url
		validates_uniqueness_of :title, :link_url

		after_save :update_routes
		after_destroy :update_routes

		def update_routes
			Rails.application.routes.draw do |map|
				Page.all.each do |page|
   				match 'cms/pages/:id', :to => 'page#show', :as => page.link_url
				end
				#mount Cms::Engine => "/cms"
			end
			Rails.application.routes.reload!	    
			#ActionController::Routing::Routes.reload!
		end
  end
end
