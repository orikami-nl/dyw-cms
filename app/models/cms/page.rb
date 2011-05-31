module Cms
  class Page < ActiveRecord::Base
		validates_presence_of :title, :link_url
		validates_uniqueness_of :title, :link_url
    
    after_save :update_route

    def add_routeC
      new_route = ActionDispatch::Routing::RouteSet.add_route(title, route_options)
      ActionDispatch::Routing::Routes.routes.insert(0, new_route)
    end
  
  def remove_route
      ActionDispatch::Routing::RouteSet.clear! { |r| r.instance_variable_get(:@requirements)[:page_id] == id }
    end
  
    def update_route
      remove_route
      add_route
    end
    
    def route_options
      @route_options ||= { :controller     => link.controller, 
                           :action         => link.action, 
                           :link_id        => link_id,
                           :page_id        => id }
  end


  end
end
