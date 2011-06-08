Rails.application.routes.draw do

  get "navigation/show_page"
	get "navigation/show_category"

  mount Cms::Engine => "/cms"

	match '/:page_title', :to => 'navigation#show_page'

end
